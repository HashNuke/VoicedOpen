class Ticket < ActiveRecord::Base
  belongs_to :ticketable, :polymorphic => true
  has_many :activities,   :dependent => :destroy
  
  validate :title, :presence => true
  validate :message, :presence => true

  after_create :publish_bushido_open_event


  def log_status_activity_by(user)
    status_action = "re-opened" if self.status == "open"
    status_action = "closed"    if self.status == "closed"

    publish_bushido_event("closed") if status_action == "closed"
    
    activity = user.activities.build(
      :action    => status_action,
      :ticket_id => self.id)
    activity.save
  end


  def publish_bushido_open_event
    publish_bushido_event("open")
  end


  def publish_bushido_event(status)
    ticketable = self.ticketable

    human_message = "#{ticketable.first_name} #{ticketable.last_name} opened ticket ##{self.id}"
    human_message = "#{ticketable.first_name} #{ticketable.last_name} closed ticket ##{self.id}" if status == "closed"
    
    ::Bushido::Event.publish({
        :category => :support_case,
        :name     => status,
        :data     => {
          :human  => human_message,
          :author => {
            :email => ticketable.email,
            :first_name => ticketable.first_name,
            :last_name  => ticketable.last_name
          },
          :title  => self.title,
          :body   => self.message,
          :source => "VoicedOpen",
          :url    =>"#{ENV['PUBLIC_URL']}/#tickets/#{self.to_param}"
        }
      })
  end


  # TODO move the loop to the mailer
  def notify_participants(activity)
    actor = activity.actable

    unique_participants = participants
    unique_participants.delete([actor.id, actor.class.name])

    unique_participants.each do |participant_info|
      participant_id, participant_class = participant_info
      participant = participant_class.constantize.find(participant_id)
      NotificationMailer.activity_on_ticket(self, activity, actor, participant).deliver if participant
    end
  end


  def participants
    poster_info = [self.ticketable_id, self.ticketable_type]
    ticket_participants = [poster_info]
    
    actors.each_pair do |actor_info, activity_count|
      ticket_participants.push(actor_info)
    end

    ticket_participants.uniq!
  end

  private

  def actors
    actors = self.activities.group(:actable_id, :actable_type).count
  end
  
end

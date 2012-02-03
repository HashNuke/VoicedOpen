class Ticket < ActiveRecord::Base
  belongs_to :ticketable, :polymorphic => true
  has_many :activities,   :dependent => :destroy
  
  validate :title, :presence => true
  validate :message, :presence => true

  after_create :publish_bushido_event
  
  def log_status_activity_by(user)
    status_action = "re-opened" if self.status == "open"
    status_action = "closed"    if self.status == "closed"

    activity = user.activities.build(
      :action    => status_action,
      :ticket_id => self.id)
    activity.save
  end

  def publish_bushido_event
    ticketable = self.ticketable
    ::Bushido::Event.publish({
        :category => :support_case,
        :name     => :opened,
        :data     => {
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
  
end

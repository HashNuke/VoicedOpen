class Activity < ActiveRecord::Base
  belongs_to :actable, :polymorphic => true
  belongs_to :ticket

  after_create :notify_participants

  def notify_participants
    ticket = self.ticket
    participants = ticket.activities.group(:actable_id, :actable_type)
    poster = ticket.ticketable

    participants.count.each_pair do |participant_info, activities_count|
      participant_id, participant_class = participant_info
      participant = participant_class.constantize.find(participant_id)
      if participant
        NotificationMailer.activity_on_ticket(ticket, participant).deliver
      end
    end
  end
end

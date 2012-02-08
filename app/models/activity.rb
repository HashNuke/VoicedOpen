class Activity < ActiveRecord::Base
  belongs_to :actable, :polymorphic => true
  belongs_to :ticket

  after_create :notify_participants_of_ticket
  
  def notify_participants_of_ticket
    self.ticket.notify_participants(self)
  end

end

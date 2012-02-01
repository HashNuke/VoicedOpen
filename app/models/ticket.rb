class Ticket < ActiveRecord::Base
  belongs_to :ticketable, :polymorphic => true
  has_many :activities,   :dependent => :destroy
  
  validate :title, :presence => true

  def log_status_activity_by(user)
    status_action = "re-opened" if self.status == "open"
    status_action = "closed"    if self.status == "closed"

    activity = user.activities.build(
      :action    => status_action,
      :ticket_id => self.id)
    activity.save
  end
  
end

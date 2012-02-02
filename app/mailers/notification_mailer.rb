class NotificationMailer < ActionMailer::Base
  default from: "s@bushi.do"

  def activity_on_ticket(ticket, user)
    @ticket = ticket
    mail(:to => user.email, :subject => "Activity on ticket #{ticket.id}")
  end
end

class NotificationMailer < ActionMailer::Base
  default from: "s@bushi.do"

  def activity_on_ticket(ticket, activity, actor, participant)
    @ticket      = ticket
    @activity    = activity
    @actor       = actor
    @participant = participant
    @actor_name  = "#{@actor.first_name} #{@actor.last_name}"


    if @activity.action == "comment"
      @mail_subject = "#{@actor_name} commented on Ticket ##{@ticket.id}"
    else
      @mail_subject = "Ticket ##{@ticket.id} #{@activity.action} by #{@actor_name}"
    end

    mail(:to => @participant.email, :subject => @mail_subject)
  end
end

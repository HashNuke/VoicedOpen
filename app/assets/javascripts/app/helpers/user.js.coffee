class App.Helpers.User
  @is_logged_in: ()->
    return false if @current_user().id ==null
    return true

  @current_user: ()->
    $.data(document, 'user')

  @can_operate_ticket: (ticket)->
    current_user = @current_user()
    return true if (current_user.scope == ticket.get('ticketable_type') && current_user.id == ticket.get('ticketable_id'))
    return true if current_user.scope == "Admin"
    return false

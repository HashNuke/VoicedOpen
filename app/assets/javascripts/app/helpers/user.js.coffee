class App.Helpers.User
  @is_logged_in: ()->
    return false if @current_user().id == ""
    return true

  @current_user: ()->
    $.data(document, 'user')
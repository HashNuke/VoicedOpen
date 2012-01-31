class App.Helpers.User
  @is_logged_in: ()->
    return false if $.data(document, 'user') == ""
    return true
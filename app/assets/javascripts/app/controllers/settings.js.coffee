class App.Controllers.Settings

  @sidebar: ()->
    setting = new App.Models.Setting({slug: "sidebar_description"})
    setting.fetch({success: ()->
      setting_view = new App.Views.Setting({model: setting})
      $(".sidebar .content").html setting_view.render().el
      $(".sidebar-description-form").hide()
      $(".sidebar-description").html setting.get('value')

      $(".sidebar .content .actions .edit-setting").show() if App.Helpers.User.current_user().scope == "Admin"
    })

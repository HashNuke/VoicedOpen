class App.Views.Setting extends Backbone.View

  className: "sidebar-desc-wrapper"
  tag: "div"

  events:
    "click .update-setting": "update_setting"
    "click .sidebar-desc"  : "show_form"

  initialize: ()->
    console.log "initialized setting view"
    @template = _.template App.Templates.Setting

  render: ()->
    $(@el).empty()
    $(@el).html @template({})
    @

  update_setting: ()->
    console.log $(".new-sidebar-desc").val()
    @model.set()
    @model.save({value: $(".new-sidebar-desc").val()}, {success: ()=>
      $(".update-form").hide()
      $(".sidebar-desc").html($(".new-sidebar-desc").val())
      $(".sidebar-desc").show()
      console.log "saved!"
    })


  show_form: ()->
    if App.Helpers.User.current_user().scope == "Admin"
      $(".new-sidebar-desc").val($(".sidebar-desc").html())
      $(".update-form").show()
      $(".sidebar-desc").hide()
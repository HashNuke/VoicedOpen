class App.Views.Setting extends Backbone.View

  className: "sidebar-desc-wrapper"
  tag: "div"

  events:
    "click .save-setting" : "update_setting"
    "click .edit-setting"  : "show_form"

  initialize: ()->
    console.log "initialized setting view"
    @template = _.template App.Templates.Setting

  render: ()->
    $(@el).empty()
    $(@el).html @template({})
    @

  update_setting: ()->
    console.log $(".sidebar-description-field").val()
    @model.save({value: $(".sidebar-description-field").val()}, {
      success: ()=>
        $(".sidebar-description-form").hide()
        $(".sidebar-description").html($(".sidebar-description-field").val())
        $(".sidebar-description").show()
        $(@el).find(".edit-setting").show()
        console.log "saved!"
    })


  show_form: ()->
    if App.Helpers.User.current_user().scope == "Admin"
      $(".sidebar-description-field").val($(".sidebar-description").html())
      $(@el).find(".edit-setting").hide()
      $(".sidebar-description-form").show()
      $(".sidebar-description").hide()
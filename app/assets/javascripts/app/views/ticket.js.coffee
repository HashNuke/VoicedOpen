class App.Views.Ticket extends Backbone.View
  tag      : "div"
  className: "ticket"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.Ticket
    @activity_list


  events:
    "click .status"      : "toggle_ticket_status"
    "click .edit-button" : "show_edit_form"
    "click .save-button" : "save_ticket"


  toggle_ticket_status: ()->
    return if not App.Helpers.User.can_operate_ticket(@model)

    @blick_interval_id = setInterval(()->
      $(@el).find(".status").fadeOut().fadeIn()
    ,2000)

    if @model.get("status") == "open"
      @model.save({status: "closed"}, {
        success: ()=>
          clearInterval(@blick_interval_id)
          App.Helpers.TicketStatus.set_to_closed()
          @activity_list.refresh_list()
      })
    else if @model.get("status") == "closed"
      @model.save({status: "open"}, {
        success: ()=>
          clearInterval(@blick_interval_id)
          App.Helpers.TicketStatus.set_to_open()
          @activity_list.refresh_list()
      })


  compiled_template: ()->
    @template({
      id        : @model.get("id")
      title     : @model.get("title"),
      user_name : "#{@model.get('ticketable').first_name} #{@model.get('ticketable').last_name}",
      status    : @model.get('status')
      message   : @model.get("message"),
      posted_at : jQuery.timeago(@model.get("created_at"))
    })

  render: ()->
    $(@el).html(@compiled_template())

    activities = new App.Collections.Activities({ticket_id: @model.get('id')})
    activities.fetch({
      success: ()=>
        @activity_list = new App.Views.ActivityList({collection: activities, ticket_id: @model.get('id')})
        $(@el).append(@activity_list.render().el)

        if App.Helpers.User.is_logged_in()
          new_comment_view = new App.Views.NewComment({ticket_id: @model.get('id'), activities_list: @activity_list})
          $(@el).append(new_comment_view.render().el)

          @display_edit_button()
    })
    @

  display_edit_button: ()->
    $(@el).find(".edit-button").show() if App.Helpers.User.can_operate_ticket(@model)

  show_edit_form: ()->
    $(@el).find(".ticket-details").hide()
    $('.ticket-form .title-field').val(@model.get('title'))
    $('.ticket-form .message-field').val(@model.get('message'))
    $(@el).find(".ticket-form").show()

  hide_edit_form: ()->
    $(@el).find(".ticket-form").hide()
    $(@el).find(".ticket-details").show()

  save_ticket: ()->
    title   = $('.ticket-form .title-field').val()
    message = $('.ticket-form .message-field').val()

    @model.save({title: title, message: message}, {
      success: ()=>
        @hide_edit_form()
    })
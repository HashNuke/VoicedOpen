class App.Helpers.ViewHandler
  show_view: (view)->
    @currentView.close() if (@currentView)

    @currentView = view;
    @currentView.render();
    $(".main").html(@currentView.el);
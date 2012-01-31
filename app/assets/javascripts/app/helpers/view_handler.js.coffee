class App.Helpers.ViewHandler
  show_view: (view, callback)->
    @currentView.close() if (@currentView)

    @currentView = view;
    @currentView.render();
    $(".main").html(@currentView.el);
    callback() if callback

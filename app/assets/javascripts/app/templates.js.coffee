App.Templates =
  OpenTicket: """
    <div class='open-ticket'>
      <div class='title'>
        <a href='#/tickets/{{ id }}'>{{ title }}</a>
      </div>
      <div class='ticket-meta'>
        <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ created_at }}</span>
      </div>
    </div>
    """

  ClosedTicket: """
    <div class='closed-ticket'>
      <div class='title'>
        <a href='#/tickets/{{ id }}'>{{ title }}</a>
      </div>
      <div class='ticket-meta'>
        <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ created_at }}</span>
      </div>
    </div>
    """

  Search      : "<input type='text' class='search'/>"

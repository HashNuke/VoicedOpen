App.Templates =

  NewTicket: """
    <h2>What are we talking about here?</h2>
    <div class='field'>
      <input class='ticket_title' type='text'/>
    </div>

    <h2>Can you explain please...</h2>
    <div class='field'>
      <textarea class='ticket_message'></textarea>
    </div>

    <div class='actions'>
      <input type='submit' class='submit btn primary'/>
    </div>
  """

  OpenTicket: """
    <div class='open-ticket'>
      <div class='title'>
        <a href='#tickets/{{ id }}'>{{ title }}</a>
      </div>
      <div class='ticket-meta'>
        <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
      </div>
    </div>
  """

  ClosedTicket: """
    <div class='closed-ticket'>
      <div class='title'>
        <a href='#tickets/{{ id }}'>{{ title }}</a>
      </div>
      <div class='ticket-meta'>
        <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
      </div>
    </div>
  """

  Search: "<input type='text' class='search'/>"
  Ticket: """
    <div class='title'>{{ title }}</div>
    <div class='meta'>
      <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
    </div>
    <div class='message'>{{ message }}</div>
    <div class='activities'></div>
  """

  CommentActivity: """
    <div class='comment-activity'>
      <div class='meta'>
        <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
      </div>
    </div>
  """

  CloseActivity: """
    <div class='closed-activity'>
    <span class='label important'>Closed</span> by <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
    </div>
  """

  RepenActivity: """
    <div class='reopened-activity'>
     <span class='label success'>Re-opened</span> by <span class='user'>{{ user_name }}</span> at <span class='created_at'>{{ posted_at }}</span>
    </div>
  """
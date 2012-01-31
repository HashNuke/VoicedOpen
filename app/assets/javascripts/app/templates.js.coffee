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
      <div class='meta'>
        by <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
      </div>
    </div>
  """

  ClosedTicket: """
    <div class='closed-ticket'>
      <div class='title'>
        <a href='#tickets/{{ id }}'>{{ title }}</a>
      </div>
      <div class='meta'>
        by <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
      </div>
    </div>
  """

  Search: "<input type='text' class='search'/>"
  Ticket: """
    <div class='ticket-details-wrapper'>
      <div class='ticket-details'>
        <div class='title'>
          <span class='status {{status}}'>{{ status }}</span>
          {{ title }}
        </div>
        <div class='meta'>
          <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
        </div>
        <div class='message'>{{ message }}</div>
      </div>
      <div class='action-bar'>
        <div class='tags'><span class='tag'>customer</span></div>
      </div>
    </div>
  """

  CommentActivity: """
    <div class='comment-activity'>
      <div class='meta'>
        <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
      </div>
      <div class='message'>{{ message }}</div>
    </div>
  """

  CloseActivity: """
    <div class='closed-activity'>
    <span class='label important'>Closed</span> by <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
    </div>
  """

  RepenActivity: """
    <div class='reopened-activity'>
     <span class='label success'>Re-opened</span> by <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
    </div>
  """
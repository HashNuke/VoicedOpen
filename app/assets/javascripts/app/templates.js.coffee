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

  Search: "<input type='text' class='search-keyword'/>"
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

  StatusActivity: """
    <div class='meta'>
      <span class='{{ action }}'>{{ action }}</span> by <span class='user'>{{ user_name }}</span> at <span class='posted_at' title='{{ posted_at }}'>{{ posted_at }}</span>
    </div>
  """

  NewComment: """
    <div class='activity'>
      <h2>Post a comment</h2>
      <textarea class='new-comment-message'></textarea>
      <div class='actions'><input type='submit' class='submit'/></div>
    </div>
  """

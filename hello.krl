ruleset echo {
  meta {
    name "Echo"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
    sharing on
    provides hello
    provides message
 
  }
  rule hello {
    select when echo hello
    send_directive("say", {"something":"Hello World"})
  }
  rule message {
    select when echo message input re#(.*)# setting(m);
    send_directive("say", {"something":m})
  }
 
}
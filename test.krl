ruleset echo {
  meta {
    name "Echo"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
    shares hello
    shares message
  }
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
    message {
      msg = "Message: " + obj;
      msg
    }
  }
  rule hello is active {
    select when echo hello
    send_directive("say", {"something":"Hello World"})
  }
  rule message is active {
    select when echo message input re#(.*)# setting(m)
    send_directive("say", {"something":m})
  }
 
}

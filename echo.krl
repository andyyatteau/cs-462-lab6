ruleset echo {
  meta {
    name "Echo"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
    shares __testing
  }
  global {
    __testing = { "queries": [ { "name": "hello", "args": [ "obj" ] },
                           { "name": "__testing" } ],
              "events": [ { "domain": "echo", "type": "hello" } ]
    }
  }
  rule hello {
    select when echo hello
    send_directive("say", {"something":"Hello World"})
  }
  rule message {
    select when echo message input re#(.*)# setting(m)
    send_directive("say", {"something":m})
  }
 
}

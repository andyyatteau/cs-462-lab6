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
    __testing = { "queries": [ { "name": "__testing" } ],
              "events": [ { "domain": "echo", "type": "hello" },
                          { "domain": "echo", "type": "message", "attrs": ["input"] } ]
    }
  }
  rule hello {
    select when echo hello
    send_directive("say", {"something":"Hello World"})
  }
  rule message {
    select when echo message
    pre { input = event:attr("input") }
    send_directive("say", {"something":input})
  }
 
}

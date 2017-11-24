ruleset track_trips {
  meta {
    name "Track Trips"
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
  rule process_trip {
    select when echo message
    pre { input = event:attr("mileage") }
    send_directive("trip", {"length":mileage})
  }
 
}

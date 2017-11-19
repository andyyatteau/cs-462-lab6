ruleset track_trips {
  meta {
    name "Track Trips"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
  }
  rule process_trip {
    select when echo message mileage re#(.*)# setting(m)
    send_directive("trip", {"length":m})
  }
 
}

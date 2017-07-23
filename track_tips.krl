ruleset track_tips {
  meta {
    name "Track Tips"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
    shares message
  }
  rule process_trip is active {
    select when echo message mileage re#(.*)# setting(m)
    send_directive("trip", {"length":m})
  }
 
}
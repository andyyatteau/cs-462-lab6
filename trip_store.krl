ruleset trip_store {
  meta {
    name "Trip Store"
    description <<
Lab 6
>>
    author "Andy Yatteau"
    logging on
    shares __testing, trips, long_trips, short_trips
    provides trips, long_trips, short_trips
  }
  global {
    __testing = { "queries": [ { "name": "__testing" } ],
              "events": [ { "domain": "explicit", "type": "processed_trip", "attrs": ["mileage"] },  
              { "domain": "explicit", "type": "found_long_trip", "attrs": ["mileage"] },
              { "domain": "car", "type": "trip_reset" } ]
            }

    trips = function() {
      trips
    }
    
    long_trips = function() {
      long_trips
    }
    
    short_trips = function() {
      trips - long_trips
    }
  }

  rule collect_trips {
    select when explicit processed_trip
    pre { mileage = event:attr("mileage") }
    always {
      ent:trips := ent:trips.put(mileage).put(time_stamp)
    }
  }

  rule collect_long_trips {
    select when explicit found_long_trip
    pre { mileage = event:attr("mileage") }
    always {
      ent:long_trips := ent:long_trips.put(mileage).put(time_stamp)
    }
  }

  rule clear_trips {
    select when car trip_reset
    always {
      clear ent:trips
      clear ent:long_trips
    }
  }

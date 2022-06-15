class TripSerializer
  def self.new_trip(weather, trip)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: trip.origin,
          end_city: trip.destination,
          travel_time: trip.readable_time,
          weather_at_eta:
            unless trip.readable_time == 'Impossible route'
              if trip.over_two_days?
                {
                  temperature: weather.daily_weather[trip.time_in_days / 86_400][:max_temp],
                  conditions: weather.daily_weather[trip.time_in_days / 86_400][:conditions]
                }
              else
                {
                  temperature: weather.hourly_weather[trip.time_in_hours / 3600][:temp],
                  conditions: weather.hourly_weather[trip.time_in_hours / 3600][:conditions]
                }
              end
            end
        }
      }
    }
  end
end

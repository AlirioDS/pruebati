class AccountweatherClient
  def temp_actual(city)
    @five_days = false
    json = JSON.parse(response(city))
    json_temp = json[0].dig("Temperature", "Metric", "Value")
  end

  def five_days(city)
    @five_days = true
    json = JSON.parse(response(city))
    json_five_days = json.dig("DailyForecasts")
  end

  def six_days(city)
    @five_days = true
    json_five_days = JSON.parse(response(city))

    total_min_temp = 0
    total_max_temp = 0
    total_days = 0

    json_five_days.dig("DailyForecasts").each_with_index do |day|
      total_days += 1

      minim_temperature = day.dig("Temperature", "Minimum", "Value").to_f
      total_min_temp += minim_temperature

      max_temperature = day.dig("Temperature", "Maximum", "Value").to_f
      total_max_temp += max_temperature
    end
    min_temp = total_min_temp/total_days
    max_temp = total_max_temp/total_days
    
    array_six_days =  [min_temp, max_temp]
  end

  private

  def response(city)
    if @five_days.eql? true
      HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{city}?apikey=v2r1BQzpMz7vsgTWEsgaoEheVKSdfw4w",format: :plain)
    else
      HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{city}?apikey=v2r1BQzpMz7vsgTWEsgaoEheVKSdfw4w",format: :plain)
    end

  end

end

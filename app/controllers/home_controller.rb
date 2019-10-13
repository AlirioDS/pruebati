class HomeController < ApplicationController
  def index
    chile_key = "115164"
    tiempo = AccountweatherClient.new
    @chile_temp = tiempo.temp_actual(chile_key)
    @chile_prox_five_days = tiempo.five_days(chile_key)
    @chile_six_day = tiempo.six_days(chile_key)

    tokio_key = "239583"
    @tokio_temp = tiempo.temp_actual(tokio_key)
    @tokio_prox_five_days = tiempo.five_days(tokio_key)
    @tokio_six_day = tiempo.six_days(tokio_key)

    paris_key = "623"
    @paris_temp = tiempo.temp_actual(paris_key)
    @paris_prox_five_days = tiempo.five_days(paris_key)
    @paris_six_day = tiempo.six_days(paris_key)

  end
end

require 'rails_helper'

describe DestinationForecast do
  it 'exists' do
    data = {:dt=>1636995965,
    :sunrise=>1636983900,
    :sunset=>1637019867,
    :temp=>68.47,
    :feels_like=>65.86,
    :pressure=>1016,
    :humidity=>18,
    :dew_point=>24.33,
    :uvi=>1.57,
    :clouds=>6,
    :visibility=>10000,
    :wind_speed=>4.41,
    :wind_deg=>227,
    :wind_gust=>7.29,
    :weather=>
     [{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}
     forecast = DestinationForecast.new(data)
     expect(forecast).to be_a(DestinationForecast)
     expect(forecast.summary).to eq("clear sky")
    expect(forecast.temp).to eq(68.47)
  end
end

require 'rails_helper'

describe Activities do
  it 'exists' do
    activity_data_temp = {:activity=>"Start a collection",
 :type=>"recreational",
 :participants=>1,
 :price=>0,
 :link=>"",
 :key=>"1718657",
 :accessibility=>0.5}
 activity_data =
 {:activity=>"Take a bubble bath",
 :type=>"relaxation",
 :participants=>1,
 :price=>0.15,
 :link=>"",
 :key=>"2581372",
 :accessibility=>0.1}
 forecast_data =
 {:dt=>1636995965,
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
  q_destination = 'denver,co'
  activites = Activities.new(q_destination, activity_data, forecast_data, activity_data_temp)
  expect(activites).to be_a(Activities)
  expect(activites.activites).to be_an(Array)
  expect(activites.destination).to eq('denver,co')
  expect(activites.forecast).to be_an(DestinationForecast)
  end
end

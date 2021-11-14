class CurrentWeather
  attr_reader :datetime, :temp, :sunrise, :sunset, :feels_like, :humidity, :visibility,:uvi, :conditions, :icon
  def initialize(data)
    @datetime = Time.at(data[:dt])
    @temp = data[:temp]
    @sunrise= Time.at(data[:sunrise])
    @sunset= Time.at(data[:sunset])
    @feels_like= data[:feels_like]
    @humidity= data[:humidity]
    @uvi= data[:uvi]
    @visibility= data[:visibility]
    @conditions= data[:weather].first[:description]
    @icon= data[:weather].first[:icon]
  end
end

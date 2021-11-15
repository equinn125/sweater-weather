require 'rails_helper'

describe ActivityFacade do
  it 'takes info and turns it into the activity', :vcr do
    activity = ActivityFacade.get_activities('39.738453', '-104.984853', 'denver,co')
    expect(activity).to be_a(Activities)
    expect(activity.activities).to be_an(Array)
    expect(activity.forecast).to be_an(DestinationForecast)
    expect(activity.destination).to be_a(String)
    expect(activity.id).to eq(nil)
    expect(activity.activities[0]).to be_a(ActivityInfo)
  end
end

require 'rails_helper'

describe ActivityFacade do
  it 'takes info and turns it into the activity', :vcr do
    activity = ActivityFacade.get_activities('39.738453', '-104.984853', 'denver,co')
    expect(activity).to be_a(Activities)
  end
end
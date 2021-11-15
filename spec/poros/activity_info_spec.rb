require 'rails_helper'

describe ActivityInfo do
  it 'has attributes' do
    data = {
    "activity": "Go to a karaoke bar with some friends",
    "type": "social",
    "participants": 4,
    "price": 0.5,
    "link": "",
    "key": "9072906",
    "accessibility": 0.35
    }
    activity = ActivityInfo.new(data)
    expect(activity.title).to eq("Go to a karaoke bar with some friends")
    expect(activity.type).to eq("social")
    expect(activity.participants).to eq(4)
    expect(activity.price).to eq(0.5)
  end
end

require 'rails_helper'
 describe BoredService do
   it 'returns an activity based on type', :vcr do
     activity = BoredService.get_activity('social')
     expect(activity).to be_a(Hash)
     expect(activity).to have_key(:activity)
     expect(activity[:activity]).to be_a(String)
     expect(activity).to have_key(:type)
     expect(activity[:type]).to be_a(String)
     expect(activity).to have_key(:participants)
     expect(activity[:participants]).to be_a(Integer)
     expect(activity).to have_key(:price)
     expect(activity[:price]).to be_a(Float)
     expect(activity).to have_key(:link)
     expect(activity[:link]).to be_a(String)
     expect(activity).to have_key(:key)
     expect(activity[:key]).to be_a(String)
     expect(activity).to have_key(:accessibility)
     expect(activity[:accessibility]).to be_a(Float)
   end
 end

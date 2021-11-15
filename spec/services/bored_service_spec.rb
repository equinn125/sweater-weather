require 'rails_helper'
 describe BoredService do
   it 'returns an activity based on type', :vcr do
     activity = BoredService.get_activity('social')
     expect(activity).to be_a(Hash)
     expect(activity).to have_key(:activity)
     expect(activity).to have_key(:type)
     expect(activity).to have_key(:participants)
     expect(activity).to have_key(:price)
     expect(activity).to have_key(:link)
     expect(activity).to have_key(:key)
     expect(activity).to have_key(:accessibility)
   end
 end

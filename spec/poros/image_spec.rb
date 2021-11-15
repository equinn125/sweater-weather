require 'rails_helper'

describe Image do
  it 'has attributes' do
    data =
        {
            "id": "NflJmUuaYVI",
            "created_at": "2020-10-15T18:26:07-04:00",
            "updated_at": "2021-11-14T05:21:43-05:00",
            "promoted_at": nil,
            "width": 5100,
            "height": 3400,
            "color": "#737373",
            "blur_hash": "LREf+-kBo}V[cIt7ozR%k?fhkCWC",
            "description": "Daybreak over downtown Denver with a view of the Rocky Mountains to the west",
            "alt_description": "aerial view of city buildings during daytime",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1&q=80&w=200"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/NflJmUuaYVI",
                "html": "https://unsplash.com/photos/NflJmUuaYVI",
                "download": "https://unsplash.com/photos/NflJmUuaYVI/download?ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw",
                "download_location": "https://api.unsplash.com/photos/NflJmUuaYVI/download?ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw"
            },
            "categories": [],
            "likes": 23,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": nil,
            "topic_submissions": {},
            "user": {
                "id": "iReUjmhpLcw",
                "updated_at": "2021-11-14T17:21:37-05:00",
                "username": "andrewcoop",
                "name": "Andrew Coop",
                "first_name": "Andrew",
                "last_name": "Coop",
                "twitter_username": nil,
                "portfolio_url": nil,
                "bio": "I'm an amateur who likes to shoot just about everything that looks interesting.  I want to get more experience with portraiture, and will shoot personal photos for anyone for free.  Where possible, attribution is appreciated please and thank you.",
                "location": "Aurora, CO, USA",
                "links": {
                    "self": "https://api.unsplash.com/users/andrewcoop",
                    "html": "https://unsplash.com/@andrewcoop",
                    "photos": "https://api.unsplash.com/users/andrewcoop/photos",
                    "likes": "https://api.unsplash.com/users/andrewcoop/likes",
                    "portfolio": "https://api.unsplash.com/users/andrewcoop/portfolio",
                    "following": "https://api.unsplash.com/users/andrewcoop/following",
                    "followers": "https://api.unsplash.com/users/andrewcoop/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": nil,
                "total_collections": 0,
                "total_likes": 36,
                "total_photos": 296,
                "accepted_tos": true,
                "for_hire": true,
                "social": {
                    "instagram_username": nil,
                    "portfolio_url": nil,
                    "twitter_username": nil,
                    "paypal_email": nil
                }
            },
            "tags": [
                {
                    "type": "search",
                    "title": "denver"
                },
                {
                    "type": "search",
                    "title": "co"
                },
                {
                    "type": "search",
                    "title": "usa"
                }
            ]
        }

    image= Image.new(data)
    expect(image.description).to eq("Daybreak over downtown Denver with a view of the Rocky Mountains to the west")
    expect(image.image_url).to eq("https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHwwfHx8MTYzNjkzMjA3Mw&ixlib=rb-1.2.1&q=85")
    expect(image.site).to eq("www.unsplash.com")
    expect(image.photographer).to eq("Andrew Coop")
    expect(image.photographer_site).to eq("https://unsplash.com/@andrewcoop")
  end
end

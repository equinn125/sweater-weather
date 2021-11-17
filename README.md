# Sweater Weather

### Welcome to Sweater Weather -A backend endpoint for roadtrip and forecast planning

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)
- [Contributors](#contributors)

### Overview

`Sweater Weather` is the backend API which enables users to check weather forecasts in various cities and roadtrip planning based on weather. This application exposes several API endpoints.

#### Learning goals and areas of focus consisted of:

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />   
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
</p>
#### DevelopmentPrinciples
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>

### <ins>Contributors</ins>

👤  **Erin Quinn**
- Github: [Erin Quinn](https://github.com/equinn125)
- LinkedIn:[Erin Quinn](https://www.linkedin.com/in/erin-quinn-a53a8b172/)
- ![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{drop,create,migrate}`
4. Run `bundle exec figaro install` to generate a hidden application.yml file for API keys
5. Collect API keys from the following [MapQuest](https://developer.mapquest.com/documentation/), [OpenWeather](https://openweathermap.org/api), [UnSplash](https://unsplash.com/documentation#creating-a-developer-account)
6. Input API keys into the `application.yml` file: `map_key: your mapquest api key here, weather_key: your openweather api key here, unsplash_key: your unsplash api key here`
- ![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### API Endpoints

<details>
  <summary>Forecast</summary>
  
  * Method: GET
 
  * Endpoint: api/v1/forecast?location=denver
  
 
```
 {
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}

```
</details>

<details>
  <summary>Background</summary>
  
  * Method: GET
 
  * Endpoint: /api/v1/backgrounds?location=denver,co
  
 
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "description": "8pm curfew was lifted.",
            "image_url": "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU2NDJ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfDB8fHwxNjM3MTE5NjQy&ixlib=rb-1.2.1&q=85",
            "site": "www.unsplash.com",
            "photographer": "Dillon Wanner",
            "photographer_site": "https://unsplash.com/@dillydallying"
        }
    }
}


```
</details>

<details>
  <summary>Register a user</summary>
  
  * Method: POST
 
  * Endpoint: /api/v1/users
  
  * Request Body:
```
  
  {
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
  
```
  
 *Response
  
```
{
    "data": {
        "id": "45",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "kCtjfplyAsJUoQiWNgudiAtt"
        }
    }
}


```
</details>

<details>
  <summary>Login a user</summary>
  
  * Method: POST
 
  * Endpoint: /api/v1/sessions
  
  * Request Body:
```
  
 {
  "email": "whatever@example.com",
  "password": "password"
}
  
```
  
 *Response
  
```
{
    "data": {
        "id": "45",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "kCtjfplyAsJUoQiWNgudiAtt"
        }
    }
}


```
</details>

<details>
  <summary>Roadtrip</summary>
  
  * Method: POST
 
  * Endpoint: /api/v1/road_trip
  
  * Request Body:
```
  
 {
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "kCtjfplyAsJUoQiWNgudiAtt"
}
  
```
  
 *Response
  
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temperature": 72.36,
                "conditions": "few clouds"
            }
        }
    }
}


```
</details>

### Acknowlegements
* MapQuestAPI
* OpenWeatherAPI
* UnSplashAPI


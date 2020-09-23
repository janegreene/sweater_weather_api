# Sweater Weather API

This is the final project of Mod 3 where we make the backend portion of a service-oriented architecture. Provided with detailed wire frames from the front end, and tasked to consume multiple external APIs to aggregate the data required.

# Endpoints

`GET '/api/v1/backgrounds?location=<city>,<state>'`

example response for this request: `GET '/api/v1/backgrounds?location=denver+co'`

    `{
"data": {
"id": null,
"type": "background",
"attributes": {
"id": null,
"url": "https://pixabay.com/get/53e3d0474e55ab14f1dc846096293f7c123bdfe1504c704f752f73d69f4ac55c_640.jpg",
"source": "Pixabay",
"location": "denver"
}
}
}`

`GET '/api/v1/forecast?location=<city>,<state>'`

example response for this request: `GET '/api/v1/forecast?location=denver,co'`

      `{
"data": {
"id": null,
"type": "forecast",
"attributes": {
"id": null,
"location": "denver,co",
"timezone": "America/Denver",
"time": " 8:39 PM, September 22",
"current": {
"day_time": " 8:39 PM, September 22",
"sunrise": " 6:48 AM",
"sunset": " 6:56 PM",
"temp": 68.41,
"feels_like": 60.26,
"humidity": 30,
"uvi": 6.48,
"visibility": 10000,
"weather": [
{
"id": 803,
"main": "Clouds",
"description": "broken clouds",
"icon": "04n"
}
]
},
"daily": [
{
"day": "Tuesday",
"max_temp": 86.99,
"min_temp": 66.94,
"icon": "10d",
"description": "Rain",
"precipitation": 1.58
},
{
"day": "Wednesday",
"max_temp": 85.26,
"min_temp": 67.14,
"icon": "01d",
"description": "Clear",
"precipitation": 0
},
{
"day": "Thursday",
"max_temp": 88.36,
"min_temp": 67.17,
"icon": "02d",
"description": "Clouds",
"precipitation": 0
},
{
"day": "Friday",
"max_temp": 89.47,
"min_temp": 68.92,
"icon": "04d",
"description": "Clouds",
"precipitation": 0
},
{
"day": "Saturday",
"max_temp": 85.68,
"min_temp": 68.05,
"icon": "04d",
"description": "Clouds",
"precipitation": 0
}
],
"hourly": [
{
"time": " 8:00 PM",
"temp": 68.41,
"icon": "10n"
},
{
"time": " 9:00 PM",
"temp": 68.81,
"icon": "04n"
},
{
"time": "10:00 PM",
"temp": 69.08,
"icon": "04n"
},
{
"time": "11:00 PM",
"temp": 69.82,
"icon": "04n"
},
{
"time": "12:00 AM",
"temp": 70.16,
"icon": "04n"
},
{
"time": " 1:00 AM",
"temp": 69.39,
"icon": "01n"
},
{
"time": " 2:00 AM",
"temp": 68.79,
"icon": "01n"
},
{
"time": " 3:00 AM",
"temp": 68.22,
"icon": "01n"
}
]
}
}
}`

___

`POST '/api/v1/users?email=<email>&password=<password>&password_confirmation=<password confirmation>'`

example response for this request: `POST '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'`

      `{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "email": "wha@example.com",
            "api_key": "2c590b41-c98f-4cf1-94df-76492a86b813"
        }
    }
}`

___

`POST '/api/v1/sessions?email=<email>&password=<password>'`

example response for this request: `'/api/v1/login?email=whatever@example.com&password=password'`

      `{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "9de69c57-3c13-4cb6-82a8-c3f8b286f03f"
        }
    }
}`

___

`POST '/api/v1/road_trip?origin=<city>,<state>&destination=<city>,<state>&api_key=<api_key>'`

example response for this request: `POST '/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=<api_key>'`

    `{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "origin": "Denver, CO",
            "destination": "Pueblo, CO",
            "duration": "2 hour(s)",
            "temperature": 71.44,
            "description": "few clouds"
        }
    }
}`

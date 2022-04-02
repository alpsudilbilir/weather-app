//
//  Response.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 2.04.2022.
//

import Foundation
import SwiftUI


struct Response: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var current: Current
    var daily: [Daily]
    var hourly: [Hourly]
    
    struct Hourly: Codable {
        var dt: Date
        var temp: Double
        var weather: [Weather]
    }
    
    struct Current: Codable {
        var dt: Date
        var temp: Double
        var feels_like: Double
        var pressure: Double
        var humidity: Int
        var wind_speed: Double
        var weather: [Weather]
        
    }
    struct Weather: Codable, Identifiable {
        var id: Int
        var main: String
        var description: String
        var icon: String
        var iconImage: Image {
            selectIcon(icon: icon)
        }
    }
    struct Daily: Codable {
        var dt: Date
        var temp: Temperature
        var weather: [Weather]
    }
    struct Temperature: Codable {
        var min: Double
        var max: Double
    }
    
    //Refactored Data

    var currentDate: String {
        "\(current.dt.formatted(.dateTime.weekday(.wide).month().day()))"
    }
    var currentTemp: String {
        "\(Int(current.temp.rounded()))°C"
    }
    var weatherIcon: Image {
        current.weather[0].iconImage
    }
    var weatherCondition: String {
        current.weather[0].main
    }
    var feelsLike: String {
        "Feels like \(Int(current.feels_like.rounded())) °C"
    }
    var currentHumidity: String {
        "\(Int(current.humidity)) %"
    }
    var currentWindSpeed: String {
        "\(current.wind_speed.formatted()) km/h"
    }
}

func selectIcon(icon: String) -> Image {
    switch icon {
    case "01d":
      return Image(systemName: "sun.max.fill")
    case "01n":
        return Image(systemName: "moon.fill")
    case "02d":
        return Image(systemName: "cloud.sun.fill")
    case "02n":
        return Image(systemName: "cloud.moon")
    case "03d":
        return Image(systemName: "cloud.fill")
    case "03n":
        return Image(systemName: "cloud.moon")
    case "04d":
        return Image(systemName: "cloud.fill")
    case "04n":
        return Image(systemName: "cloud.moon")
    case "09d":
        return Image(systemName: "cloud.heavyrain.fill")
    case "09n":
        return Image(systemName: "cloud.heavyrain.fill")
    case "10d":
        return Image(systemName: "cloud.rain.fill")
    case "10n":
        return Image(systemName: "cloud.rain.fill")
    case "11d":
        return Image(systemName: "cloud.bolt.fill")
    case "11n":
        return Image(systemName: "cloud.bolt.fill")
    case "13d":
        return Image(systemName: "snowflake")
    case "13n":
        return Image(systemName: "snowflake")
    case "50d":
        return Image(systemName: "sun.haze.fill")
    case "50n":
        return Image(systemName: "sun.haze.fill")
    default:
        return Image(systemName: "sun.max")
    }
}

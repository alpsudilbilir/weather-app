//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 30.03.2022.
//
import CoreLocation
import Foundation
import SwiftUI

final class WeatherManager {
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Response {
        
        let API_KEY = "Write your API key here."
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(API_KEY)&units=metric") else {
            fatalError("Unvalid URL!")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error when fetching weather data.")
        }
        
        guard let decoded = try? JSONDecoder().decode(Response.self, from: data) else {
            fatalError("Unable to decode data!")
        }
        
        return decoded
    }
}

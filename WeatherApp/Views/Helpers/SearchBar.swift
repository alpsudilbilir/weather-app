//
//  SearchBar.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 9.04.2022.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var locationManager: LocationManager
    let weatherManager = WeatherManager()
    @State private var location: String = ""
    @State private var isSearchActive = false
    @Binding var currentWeather: Response
    var body: some View {
        if isSearchActive {
            TextField("Search", text: $location)
        }
        Button(action: {
            isSearchActive.toggle()
            Task {
                weatherManager.getCoordinateFrom(address: location) { coordinate, error in
                    guard let coordinate = coordinate else { return }
                    Task {
                        currentWeather = try await weatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
                        locationManager.updateCityName(latitude: coordinate.latitude, longitude: coordinate.longitude)
                    }
                }
            }
        }, label: {
            Image(systemName: "magnifyingglass")
        })
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(currentWeather: .constant(weatherData))
    }
}

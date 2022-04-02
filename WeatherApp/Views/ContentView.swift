//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    var weatherManager = WeatherManager()
    @State var weather: Response?
    var body: some View {
        if locationManager.userLocation == nil {
            WelcomeView()
        } else {
            if let location = locationManager.userLocation {
                if let weather = weather {
                    WeatherView(currentWeather: weather)
                        .environmentObject(locationManager)
                        .onAppear {
                            locationManager.updateCityName(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                        }
                } else {
                    ProgressView()
                        .task {
                            do {
                                weather = try await weatherManager.fetchWeather(latitude: (locationManager.userLocation?.coordinate.latitude)!, longitude: (locationManager.userLocation?.coordinate.longitude)!)
                            } catch {
                                print("Error when getting weather.")
                            }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}

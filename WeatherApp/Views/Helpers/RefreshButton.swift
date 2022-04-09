//
//  RefreshButton.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 31.03.2022.
//

import SwiftUI

struct RefreshButton: View {
    @EnvironmentObject var locationManager: LocationManager
    let weatherManager = WeatherManager()
    @Binding var currentWeather: Response
    var body: some View {
        Button {
            Task {
                currentWeather = try await weatherManager.fetchWeather(latitude: (locationManager.userLocation?.coordinate.latitude)!, longitude: (locationManager.userLocation?.coordinate.longitude)!)
                locationManager.updateCityName(latitude: (locationManager.userLocation?.coordinate.latitude)!, longitude: (locationManager.userLocation?.coordinate.longitude)!)
            }
        } label: {
            Image(systemName: "house")
                .foregroundColor(.white)
        }
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton(currentWeather: .constant(weatherData))
    }
}

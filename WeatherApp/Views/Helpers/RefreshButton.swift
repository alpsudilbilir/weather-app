//
//  RefreshButton.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 31.03.2022.
//

import SwiftUI

struct RefreshButton: View {
    let weatherManager = WeatherManager()
    let locationManager = LocationManager()
    @Binding var currentWeather: Response
    var body: some View {
        HStack {
            Spacer()
            Button {
                Task {
                    currentWeather = try await weatherManager.fetchWeather(latitude: (locationManager.userLocation?.coordinate.latitude)!, longitude: (locationManager.userLocation?.coordinate.longitude)!)
                }
            } label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
            }
        }
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton(currentWeather: .constant(weatherData))
    }
}

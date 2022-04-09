//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 2.04.2022.
//

import SwiftUI

struct WeatherInfo: View {
    @EnvironmentObject var locationManager: LocationManager
    var currentWeather: Response
    var body: some View {
        VStack(spacing: 12) {
            Text(currentWeather.currentDate)
            Text(locationManager.cityName)
                .font(.largeTitle)
                .animation(.easeIn.delay(0.2))
            currentWeather.weatherIcon
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 140)
            Text(currentWeather.currentTemp)
                .font(.largeTitle)
                .bold()
            Text(currentWeather.weatherCondition)
                .font(.title2)
            Text(currentWeather.feelsLike)
        }
        .foregroundColor(.white)
    }
}

struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfo(currentWeather: weatherData)
            .environmentObject(LocationManager())
            .preferredColorScheme(.dark)
    }
}

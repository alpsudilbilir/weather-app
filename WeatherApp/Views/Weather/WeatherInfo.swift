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
                .foregroundColor(.white)
            Text(locationManager.cityName)
                .foregroundColor(.white)
                .font(.largeTitle)
                .animation(.easeIn.delay(0.2))
            currentWeather.weatherIcon
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)
            Text(currentWeather.currentTemp)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
            Text(currentWeather.weatherCondition)
                .foregroundColor(.white)
                .font(.title2)
            Text(currentWeather.feelsLike)
                .foregroundColor(.white)
        }
    }
}

struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfo(currentWeather: weatherData)
            .environmentObject(LocationManager())
            .preferredColorScheme(.dark)
    }
}

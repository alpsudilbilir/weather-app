//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 30.03.2022.
//

import SwiftUI

struct WeatherRow: View {
    var currentWeather: Response
    var body: some View {
        HStack(spacing: 40) {
            VStack {
                Image(systemName: "humidity.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Humidity")
                    .font(.subheadline)
                Text(currentWeather.currentHumidity)
            }
            VStack {
                Image(systemName: "wind")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Wind Speed")
                    .font(.subheadline)
                Text(currentWeather.currentWindSpeed)
            }
        }
        .foregroundColor(.white)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(currentWeather: weatherData)
            .preferredColorScheme(.dark)
    }
}

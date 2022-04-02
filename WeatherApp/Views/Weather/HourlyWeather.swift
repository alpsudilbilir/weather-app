//
//  HourlyWeather.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 3.04.2022.
//

import SwiftUI

struct HourlyWeather: View {
    var hourlyWeather: Response
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                ForEach(1..<7) { i in
                    VStack(spacing: 20) {
                        Text(hourlyWeather.hourly[i].dt.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .omitted)).minute()))
                        ZStack {
                            Circle().stroke()
                                .overlay {
                                    hourlyWeather.hourly[i].weather.first!.iconImage
                                        .renderingMode(.original)
                                }
                        }
                        Text("\( Int( hourlyWeather.hourly[i].temp))°C")
                    }
                    Divider()
                }
                .frame(height: 110)
                .foregroundColor(.white)
            }
            .padding()
            .font(.subheadline)
        }
    }
}

struct HourlyWeather_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeather(hourlyWeather: weatherData)
            .preferredColorScheme(.dark)
    }
}

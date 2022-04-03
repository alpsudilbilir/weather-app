//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 31.03.2022.
//

import SwiftUI

struct DailyWeather: View {
    var dailyWeather: Response
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                ForEach(0..<8) { i in
                    VStack(spacing: 20) {
                        Text("\((Date(timeIntervalSince1970: dailyWeather.daily[i].dt).formatted(.dateTime.weekday())))")
                        ZStack {
                            Circle().stroke()
                                .overlay {
                                    dailyWeather.daily[i].weather.first!.iconImage
                                        .renderingMode(.original)
                                }
                        }
                        Text("\(Int( dailyWeather.daily[i].temp.max.rounded()))°C")
                        Text("\(Int(dailyWeather.daily[i].temp.min.rounded()))°C")
                    }
                    .animation(.ripple(index: i))
                    Divider()
                }
                .frame(height: 150)
                .foregroundColor(.white)
            }
            .padding()
            .font(.subheadline)
        }
        .animation(.easeInOut(duration: 1))
        
    }
}

struct DailyWeather_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeather(dailyWeather: weatherData)
            .preferredColorScheme(.dark)
    }
}

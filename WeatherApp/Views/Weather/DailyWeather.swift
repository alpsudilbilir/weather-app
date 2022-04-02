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
                ForEach(1..<8) { i in
                    VStack(spacing: 20) {
                        Text(dailyWeather.daily[i].dt.formatted(.dateTime.weekday()))
                        ZStack {
                            Circle().stroke()
                                .overlay {
                                    dailyWeather.daily[i].weather.first!.iconImage
                                        .renderingMode(.original)
                                }

                        }


                        Text("\( Int( dailyWeather.daily[i].temp.max))°C")
                        Text("\(Int(  dailyWeather.daily[i].temp.min))°C")
                    }
                    Divider()
                }
                .frame(height: 150)
                .foregroundColor(.white)
            }
            .padding()
            .font(.subheadline)
        }

    }
}

struct DailyWeather_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeather(dailyWeather: weatherData)
            .preferredColorScheme(.dark)
    }
}

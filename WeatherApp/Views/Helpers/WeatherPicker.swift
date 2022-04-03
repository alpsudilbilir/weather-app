//
//  WeatherPicker.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 3.04.2022.
//

import SwiftUI

struct WeatherPicker: View {
    let forecasts = ["Daily", "Hourly"]
    @State private var selection = "Daily"
    var weather: Response
    var body: some View {
        VStack(spacing: 5) {
            Picker("Select Forecast Info", selection: $selection) {
                ForEach(forecasts, id:\.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(8)
            .padding()
            if selection == "Daily" {
                DailyWeather(dailyWeather: weather)
                
            } else {
                HourlyWeather(hourlyWeather: weather)
            }
        }
    }

}
struct WeatherPicker_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPicker(weather: weatherData)
    }
}

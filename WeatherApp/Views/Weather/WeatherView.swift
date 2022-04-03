//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 30.03.2022.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var locationManager: LocationManager
    let weatherManager = WeatherManager()
    @State var currentWeather: Response
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .blue], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    RefreshButton(currentWeather: $currentWeather)
                        .padding()
                    WeatherInfo(currentWeather: currentWeather)
                    WeatherRow(currentWeather: currentWeather)
                    Divider()
                    WeatherPicker(weather: currentWeather)
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(currentWeather: weatherData)
            .environmentObject(LocationManager())
    }
}

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
            Image("background2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        RefreshButton(currentWeather: $currentWeather)
                        Spacer()
                        SearchBar(currentWeather: $currentWeather)
                    }
                    .padding()
                    WeatherInfo(currentWeather: currentWeather)
                    WeatherRow(currentWeather: currentWeather)
                    Divider()
                    WeatherPicker(weather: currentWeather)
                }
                .foregroundColor(.white)
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

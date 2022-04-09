//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 29.03.2022.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(locationManager)
        }
    }
}

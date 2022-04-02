//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 29.03.2022.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .blue.opacity(0.5)], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 45) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                Text("Please share your current location to see the weather.")
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                Button {
                    locationManager.requestLocation()
                } label: {
                    Label("Get Location", systemImage: "location")
                        .frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .font(.title)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

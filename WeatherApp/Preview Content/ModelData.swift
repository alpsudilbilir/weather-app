//
//  ModelData.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 30.03.2022.
//

import Foundation

var weatherData: Response =  load("modelWeather.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    //Get the file in bundle.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    //Convert file to data and load it to data.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    //
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


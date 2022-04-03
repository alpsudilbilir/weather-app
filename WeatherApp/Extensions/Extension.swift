//
//  Extension.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 3.04.2022.
//

import Foundation
import SwiftUI
extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(1)
            .delay(0.1 * Double(index))
    }
}

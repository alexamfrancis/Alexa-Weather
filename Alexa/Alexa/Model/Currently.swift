//
//  Currently.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/3/21.
//

import Foundation

class Currently: Codable {
    
    var time: Int?
    var summary: String?
    var icon: String?
    var precipIntensity: Double?
    var precipProbability: Double?
    var temperature: Double?
    var apparentTemperature: Double?
    var dewPoint: Double?
    var humidity: Double?
    var pressure: Double?
    var windSpeed: Double?
    var windGust: Double?
    var windBearing: Double?
    var uvIndex: Int?
    var visibility: Int?
    var ozone: Double?
    
}

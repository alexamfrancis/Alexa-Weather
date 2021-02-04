//
//  Weather.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/2/21.
//

import Foundation

class Weather: Codable {
    
    var latitude: Double?
    var longitude: Double?
    var minutely: MinutelyWrapper?
    var timezone: String?
    var currently: Currently?
    var hourly: HourlyWrapper?
    var daily: DailyWrapper?
    
}

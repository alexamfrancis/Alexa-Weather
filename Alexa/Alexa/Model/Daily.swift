//
//  Daily.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/3/21.
//

import Foundation

class DailyWrapper: Codable {
    
    var summary: String?
    var icon: String?
    var data: [Daily]?
    
}

class Daily: Codable {
    
    var time: Int?
    var summary: String?
    var icon: String?
    var sunriseTime: Int?
    var sunsetTime: Int?
    var moonPhase: Double?
    // TODO: add the rest
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
/*
 "time": 1612281600,
 "summary": "Possible light rain in the afternoon and evening.",
 "icon": "rain",
 "sunriseTime": 1612306440,
 "sunsetTime": 1612343820,
 "moonPhase": 0.71,
 "precipIntensity": 0.0017,
 "precipIntensityMax": 0.0149,
 "precipIntensityMaxTime": 1612342620,
 "precipProbability": 0.44,
 "precipType": "rain",
 "temperatureHigh": 40.69,
 "temperatureHighTime": 1612334940,
 "temperatureLow": 30.3,
 "temperatureLowTime": 1612371540,
 "apparentTemperatureHigh": 31.75,
 "apparentTemperatureHighTime": 1612334580,
 "apparentTemperatureLow": 18.37,
 "apparentTemperatureLowTime": 1612371300,
 "dewPoint": 24.96,
 "humidity": 0.67,
 "pressure": 1023.7,
 "windSpeed": 16.61,
 "windGust": 32.16,
 "windGustTime": 1612349160,
 "windBearing": 243,
 "cloudCover": 0.39,
 "uvIndex": 2,
 "uvIndexTime": 1612327500,
 "visibility": 10,
 "ozone": 389.3,
 "temperatureMin": 30.62,
 "temperatureMinTime": 1612293720,
 "temperatureMax": 40.69,
 "temperatureMaxTime": 1612334940,
 "apparentTemperatureMin": 19.77,
 "apparentTemperatureMinTime": 1612368000,
 "apparentTemperatureMax": 31.75,
 "apparentTemperatureMaxTime": 1612334580

 */

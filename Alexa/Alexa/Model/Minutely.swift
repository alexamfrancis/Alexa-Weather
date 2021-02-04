//
//  Minutely.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/4/21.
//

import Foundation

class MinutelyWrapper: Codable {
    
    var icon: String?
    var summary: String?
    var data: [Minutely]?
    
}

class Minutely: Codable {
    
    var precipIntensity: Double?
    var precipProbability: Double?
    var time: Int?
    
}

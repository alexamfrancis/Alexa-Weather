//
//  NetworkManager.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/4/21.
//

import Foundation
import CoreLocation

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func getWeather(from coordinate: CLLocationCoordinate2D, completion: @escaping ((Weather) -> ())) {
        guard let url = URL(string: "https://api.forecast.io/forecast/d3250bf407f0579c8355cd39cdd4f9e1/\(coordinate.latitude),\(coordinate.longitude)") else { return }
        if let data = try? Data(contentsOf: url) {
            do {
                let parsed = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                guard let dict = parsed as? [String: Any] else {
                    print("Failed to decode parsed as weather\nparsed:\n\(parsed)")
                    return
                }
                let weather = try Weather(from: dict)
                DispatchQueue.main.async {
                    completion(weather)
                }
            }
            catch let error as NSError {
                print("A JSON parsithng error occurred, here are the details:\n \(error)")
            }
        }
    }
    
}

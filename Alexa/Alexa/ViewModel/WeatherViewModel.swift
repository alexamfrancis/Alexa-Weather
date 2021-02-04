//
//  WeatherViewModel.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/4/21.
//

import Foundation
import CoreLocation

class WeatherViewModel {
    
    private var locationManager = CLLocationManager()
    private var location: CLLocation?
    
    var weather: Weather?
    
    init() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = self.locationManager.location else {
                return
            }
            self.location = currentLocation
            print(currentLocation.coordinate.latitude)
            print(currentLocation.coordinate.longitude)
            NetworkManager.shared.getWeather(from: currentLocation.coordinate) { weather in
                self.weather = weather
            }
        }
    }
    
}

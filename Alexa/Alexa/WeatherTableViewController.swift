//
//  WeatherTableViewController.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/2/21.
//

import UIKit
import CoreLocation

enum PLError: Error {
    case decoding
}

class WeatherTableViewController: UITableViewController {
    
    private var locationManager = CLLocationManager()
    private var location: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            self.getWeather(from: currentLocation.coordinate) { dict in
                do {
                    let weather = try Weather(from: dict)
                    print(weather)
                } catch {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
        
    }
    
    private func getWeather(from coordinate: CLLocationCoordinate2D, completion: @escaping (([String: Any]) -> ())) {
        guard let url = URL(string: "https://api.forecast.io/forecast/d3250bf407f0579c8355cd39cdd4f9e1/\(coordinate.latitude),\(coordinate.longitude)") else { return }
        if let data = try? Data(contentsOf: url) {
            do {
                let parsed = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                guard let weather = parsed as? [String: Any] else {
                    print("Failed to decode parsed as weather\nparsed:\n\(parsed)")
                    return
                }
                print(weather)
                DispatchQueue.main.async {
                    completion(weather)
                }
            }
            catch let error as NSError {
                print("A JSON parsithng error occurred, here are the details:\n \(error)")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = indexPath.row == 0 ? "Latitude: \(String(describing: self.location?.coordinate.latitude))" : "Longitude: \(String(describing: self.location?.coordinate.longitude))"
        return cell
    }
    
}

//
//  WeatherTableViewController.swift
//  Alexa
//
//  Created by Alexandra Francis on 2/2/21.
//

import UIKit


class WeatherTableViewController: UITableViewController {
    
    private var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = WeatherViewModel()
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
        cell.textLabel?.text = indexPath.row == 0 ? "Summary: \(self.viewModel?.weather.currently?.summary ?? "N/A")" : "Temperature: \(self.viewModel?.weather.currently?.temperature ?? 0)"
        return cell
    }
    
}

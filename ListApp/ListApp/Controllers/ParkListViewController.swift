//
//  ViewController.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import UIKit

class ParkListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var parks: [Park] = []
    var parkService: ParkService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.parkService = ParkService()
        self.parks = self.parkService.getParks()

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
    
extension ParkListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "parkCell") as! ParkCell
        
        let currentPark = self.parks[indexPath.row]
        
        cell.park = currentPark
        cell.parkNameLabel.text = currentPark.name
        cell.parkCountryLabel.text = currentPark.country
        cell.accessoryType = currentPark.confirmedPark ? .checkmark : .none
        return cell
    }
}

extension ParkListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? ParkCell {
            cell.park?.confirmedPark = true
            cell.accessoryType = cell.park!.confirmedPark ? .checkmark : .none
        }
    }
    
}
    



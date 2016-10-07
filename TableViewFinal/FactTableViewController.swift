//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var factTableView: UITableView!
    
    let factCellIdentifier: String = "FactCell"
    var planet: Planet = Planet(name: "Felicity", numberOfMoons: 1, fullOrbit: 12.0, facts: [""])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(planet)"
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as! FactTableViewCell
        cell.factTextView.text = String(planet.facts[indexPath.row])
        return cell
    }
    
}

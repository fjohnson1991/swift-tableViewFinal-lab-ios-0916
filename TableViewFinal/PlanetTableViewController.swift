//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var planetTableView: UITableView!
    let planetCellIdentifier: String =  "PlanetCell"
    var planets = [Planet]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    func generatePlanetInfo() {
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts:
            ["Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."])
        
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts:
            ["Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth."])
        
        planets = [earth, mars]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planetToFacts" {
            let dest = segue.destination as! FactTableViewController
                if let indexPath = planetTableView.indexPathForSelectedRow {
                    dest.planet = planets[indexPath.row]
                    
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planet = planets[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        cell.planetNameLabel.text = String(planets[indexPath.row].name)
        cell.numberOfMoonsLabel.text = String(planets[indexPath.row].numberOfMoons)
        cell.numberOfDaysFullOrbitLabel.text = String(planets[indexPath.row].fullOrbit)
        cell.numberOfFacts.text = String(planet.facts.count)
        return cell
    }
    
}

//
//  ViewController.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/4/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeWorldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func randomBtnPressed(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        //personApi.getRandomPersonUrlSession(id: random) { (person) in
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        /* LONG WAY
         if person.homeworldUrl.isEmpty {
            homeworldBtn.isEnabled = false
         } else {
            homeworldBtn.isEnabled = true
 
         */
        
        // Use Bool Operator
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
        
        // OPTION 2 SWTCH WITH ENUM
        /*
        switch segue.identifier {
        case Segue.homeworld.rawValue:
            if let destination = segue.destination as? HomeWorldVC {
                destination.person = person
            }
        case Segue.vehicles.rawValue:
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
        case Segue.starships.rawValue:
            if let destination = segue.destination as? StarShipsVC {
                destination.person = person
            }
        case Segue.films.rawValue:
            if let destination = segue.destination as? FilmsVC {
                destination.person = person
            }
        default:
            break
        }
    }
    
    enum Segue: String {
        case homeworld = "toHomeWorld"
        case vehicles = "toVehicles"
        case starships = "toStarShips"
        case films = "toFilms"
    }
        */
        // OPTION 1 - IF THEN ELSE
        // Switched If then else to switch above which required the enum as well
        /*
        if segue.identifier == "toHomeWorld" {
            if let destination = segue.destination as? HomeWorldVC {
                destination.person = person
            }
        } else if segue.identifier == "toVehicles" {
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
                }
            
        } else if segue.identifier == "toStarShips" {
            if let destination = segue.destination as? StarShipsVC {
                destination.person = person
            }
            
        } else if segue.identifier == "toFilms" {
            if let destination = segue.destination as? FilmsVC {
                destination.person = person
            }
        }
 */
    
}
// HAS TO BE OUTSIDE THE class SelectPersonVC: UIViewController ending }
    protocol PersonProtocol {
        var person: Person! {get set}
}

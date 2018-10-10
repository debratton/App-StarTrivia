//
//  StarShipsVC.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

// Conform to protocol in SelectPersonVC
class StarShipsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var hyperdriveLbl: UILabel!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    var person: Person!
    let api = StarShipApi()
    var starships = [String]()
    var currentStarShips = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarShip = starships.first else { return }
        getStarShip(url: firstStarShip)
        
    }
    
    func getStarShip(url: String) {
        api.getStarShip(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: StarShip) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        hyperdriveLbl.text = starship.hyperdrive
    }
    
    
    @IBAction func previousPressed(_ sender: Any) {
        currentStarShips -= 1
        setButtonState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentStarShips += 1
        setButtonState()
    }
    
    func setButtonState() {
        if currentStarShips == 0 {
            previousBtn.isEnabled = false
        } else {
            previousBtn.isEnabled = true
        }
        
        if currentStarShips == starships.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
        getStarShip(url: starships[currentStarShips])
    }
}

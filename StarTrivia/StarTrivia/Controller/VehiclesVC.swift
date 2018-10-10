//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

// Conform to protocol in SelectPersonVC
class VehiclesVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    
    
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
    }
    

}

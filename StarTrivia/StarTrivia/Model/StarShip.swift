//
//  StarShip.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/10/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation

struct StarShip: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let crew: String
    let passengers: String
    let hyperdrive: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case crew
        case passengers
        case hyperdrive = "hyperdrive_rating"
    }
}

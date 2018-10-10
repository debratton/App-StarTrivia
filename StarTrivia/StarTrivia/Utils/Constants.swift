//
//  Constants.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/4/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor
let BLACK_BG_RADIUS: CGFloat = 10
let URL_BASE = "https://swapi.co/api/"
//Hard Code Luke
//let PERSON_URL = URL_BASE + "people/1/"
let PERSON_URL = URL_BASE + "people/"
typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeWorldResponseCompletion = (HomeWorld?) -> Void

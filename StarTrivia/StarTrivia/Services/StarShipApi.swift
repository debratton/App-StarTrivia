//
//  StarShipApi.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/10/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation
import Alamofire

class StarShipApi {
    func getStarShip(url: String, completion: @escaping StarShipResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let starship = try jsonDecoder.decode(StarShip.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

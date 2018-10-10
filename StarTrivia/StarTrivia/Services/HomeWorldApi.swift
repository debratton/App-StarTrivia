//
//  HomeWorldApi.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation
import Alamofire

class HomeWorldApi {
    
    func getHomeWorld(url: String, completion: @escaping HomeWorldResponseCompletion) {
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
                let homeworld = try jsonDecoder.decode(HomeWorld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

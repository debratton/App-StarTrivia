//
//  FilmApi.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/10/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation
import Alamofire

class FilmApi {
    
    func getFilm(url: String, completion: @escaping FilmResponseCompletion) {
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
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

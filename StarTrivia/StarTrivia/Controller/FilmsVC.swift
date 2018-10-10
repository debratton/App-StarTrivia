//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

// Conform to protocol in SelectPersonVC
class FilmsVC: UIViewController, PersonProtocol {

    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

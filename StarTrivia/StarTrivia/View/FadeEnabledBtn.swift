//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/9/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled  {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
        
            }
    
        }

    }
}

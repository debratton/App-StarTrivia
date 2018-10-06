//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by David E Bratton on 10/4/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = BLACK_BG_RADIUS
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = BLACK_BG_RADIUS
    }
}

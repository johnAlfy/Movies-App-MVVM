//
//  RoundedLikeButton.swift
//  Movies App
//
//  Created by John Alfy on 1/11/22.
//

import Foundation
import UIKit

class RoundedButton : UIButton {
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

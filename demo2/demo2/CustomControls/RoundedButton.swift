//
//  RoundedButton.swift
//  demo2
//
//  Created by MAC on 8/18/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable
    public var cornerRadius: CGFloat = 15 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    override open var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? UIColor(hex: "#003D9A") : UIColor.gray
        }
    }
}

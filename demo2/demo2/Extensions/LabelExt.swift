//
//  LabelExt.swift
//  demo2
//
//  Created by MAC on 8/18/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

enum FontType {
    case Normal
    case Bold
    case Italic
}

extension UILabel {
    func setMultiline() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    func setFont(type: FontType, size: CGFloat) {
        switch type {
        case .Bold:
            self.font = UIFont.boldSystemFont(ofSize: size)
            break
        case .Italic:
            self.font = UIFont.italicSystemFont(ofSize: size)
        default:
            self.font = UIFont.systemFont(ofSize: size)
        }
    }
}

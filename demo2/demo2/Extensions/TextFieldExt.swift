//
//  StringExt.swift
//  demo2
//
//  Created by MAC on 8/20/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

extension UITextField {
    func checkEmptyString() -> Bool {
        if(self.text == nil) {
          return true
        }
        return self.text!.isEmpty
    }
}

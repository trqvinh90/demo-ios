//
//  LoginViewModel.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class LoginViewModel {
   
    func doLogin(email: String, password: String, completion: (Bool) -> ()) {
        let defaults = UserDefaults.standard
        let emailStore = defaults.string(forKey: defaultsKeys.emailKey)
        
        if(emailStore != nil && email == emailStore){
            completion(true)
        }
        else {
            completion(false)
        }
    }
}

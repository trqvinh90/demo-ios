//
//  OnboardingViewModel.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class OnboardingViewModel {
    var info: PersonalInfo? = nil
    
    func doRegister(completion: (Bool) -> ()) {
        let defaults = UserDefaults.standard
        let email = defaults.string(forKey: defaultsKeys.emailKey)
        
        if(email == nil || (email != nil && info?.emailAddress != email)){
            // do register
            defaults.set(info?.emailAddress, forKey: defaultsKeys.emailKey)
            defaults.set(info?.firstName, forKey: defaultsKeys.firstNameKey)
            defaults.set(info?.lastName, forKey: defaultsKeys.lastNameKey)
            defaults.set(info?.amount, forKey: defaultsKeys.amountKey)
            completion(true)
        }
        else {
           completion(false)
        }
    }
}

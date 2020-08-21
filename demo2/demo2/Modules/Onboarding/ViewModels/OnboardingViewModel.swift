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
        let lastName = defaults.string(forKey: defaultsKeys.lastNameKey)
        let amount = defaults.integer(forKey: defaultsKeys.amountKey)
        completion(false)
    }
}

//
//  DashboardViewModel.swift
//  demo2
//
//  Created by MAC on 8/20/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    var info: Observable<PersonalInfo?> = Observable(nil)
    
    init() {
        
    }
    
    func fetchData() {
        let defaults = UserDefaults.standard
        let firstName = defaults.string(forKey: defaultsKeys.firstNameKey)
        let lastName = defaults.string(forKey: defaultsKeys.lastNameKey)
        let email = defaults.string(forKey: defaultsKeys.emailKey)
        let amount = defaults.integer(forKey: defaultsKeys.amountKey)
        self.info = Observable(PersonalInfo(firstName: firstName!, lastName: lastName!, emailAddress: email!, amount: amount))
    }
    
    func updateAmount(amount: Int) {
        if let currentAmount = self.info.value?.amount {
            let newAmount = currentAmount + amount
            info.self.value?.amount = newAmount
            
            // save amount to local storage
            let defaults = UserDefaults.standard
            defaults.set(newAmount, forKey: defaultsKeys.amountKey)
        }
    }
}

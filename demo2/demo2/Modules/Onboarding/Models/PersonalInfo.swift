//
//  PersonalInfo.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

struct PersonalInfo: Decodable {
    let firstName: String
    let lastName: String
    let emailAddress: String
    var passcode: String
    var amount: Int
    
    init(firstName: String, lastName: String, emailAddress: String, amount: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        self.passcode = ""
        self.amount = amount ?? 100
    }
}


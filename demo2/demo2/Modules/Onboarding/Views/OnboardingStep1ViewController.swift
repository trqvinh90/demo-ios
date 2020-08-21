//
//  OnboardingStep2ViewController.swift
//  demo2
//
//  Created by MAC on 8/18/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class OnboardingStep1ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailAddressTF: UITextField!
    @IBOutlet weak var continueBtn: RoundedButton!
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        emailAddressTF.delegate = self
        
        continueBtn.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        continueBtn.isEnabled = (!firstNameTF.checkEmptyString() && !lastNameTF.checkEmptyString() && !emailAddressTF.checkEmptyString())
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is UINavigationController){
            let navController = segue.destination as? UINavigationController
            if let topVC = navController?.topViewController as? OnboardingStep2ViewController
            {
                topVC.vm.info = PersonalInfo(firstName: firstNameTF.text!, lastName: lastNameTF.text!, emailAddress: emailAddressTF.text!)
            }
        }
    }

}

//
//  LoginViewController.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let vm = LoginViewModel()

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passLabel: UITextField!
    
    @IBAction func doLogin(_ sender: Any) {
        vm.doLogin(email: emailLabel.text ?? "", password: passLabel.text ?? "", completion: {(flag) -> () in
            if(flag) {
                self.present(DashboardViewController(), animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Email or password is wrong", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

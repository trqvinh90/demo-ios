//
//  LoginViewController.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func doLogin(_ sender: Any) {
        self.present(DashboardViewController(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

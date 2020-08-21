//
//  OnboardingStep3ViewController.swift
//  demo2
//
//  Created by MAC on 8/18/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class OnboardingStep2ViewController: UIViewController {
    
    let vm = OnboardingViewModel()

    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doRegister(_ sender: RoundedButton) {
        vm.doRegister {(flag) -> () in
            if(flag) {
                self.present(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Email is already existed", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
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

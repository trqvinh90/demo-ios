//
//  LoginViewController.swift
//  demo2
//
//  Created by MAC on 8/17/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        // container
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let img = UIImageView(image: UIImage(named: "Onboard1"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        let label1 = UILabel()
        label1.text = "A Bank You Actually Want To Use."
        label1.textColor = UIColor(hex: "#003D9A")
        label1.setFont(type: .Bold, size: 28)
        label1.setMultiline()
        let label2 = UILabel()
        //label2.text = "Managing money is a lifelong pursuit. Welcome to the world’s first digital bank where doing more and saving better is rewarded."
        label2.setMultiline()
        label2.textColor = UIColor(hex: "#929292")
        label2.setFont(type: .Normal, size: 14)
        label2.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSMutableAttributedString(string: "Managing money is a lifelong pursuit. Welcome to the world’s first digital bank where doing more and saving better is rewarded.")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        // *** Set Attributed String to your label ***
        label2.attributedText = attributedString
        let button = RoundedButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(hex: "#003D9A")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goToOnboarding), for: .touchUpInside)
        let label3 = UILabel()
        label3.attributedText = NSAttributedString(string: "I already have an account", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label3.textColor = UIColor(hex: "#929292")
        label3.setFont(type: .Normal, size: 16)
        label3.textAlignment = .center
        label3.isUserInteractionEnabled = true
        label3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToLogin)))
        
        stack.addArrangedSubview(img)
        stack.addArrangedSubview(label1)
        stack.addArrangedSubview(label2)
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(label3)
        view.addSubview(stack)
        
        stack.setCustomSpacing(100, after: label2)
        stack.setCustomSpacing(17, after: button)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func goToOnboarding(sender: UIButton!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let onboardingVC = storyBoard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        self.present(onboardingVC, animated: true, completion: nil)
    }
    
    @objc func goToLogin(_sender: UITapGestureRecognizer){
        self.present(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true, completion: nil)
    }
}

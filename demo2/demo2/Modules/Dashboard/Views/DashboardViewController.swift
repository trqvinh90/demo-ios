//
//  DashboardViewController.swift
//  demo2
//
//  Created by MAC on 8/19/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var balanceLabel: UILabel!
    var nameLabel: UILabel!
    var viewModel = DashboardViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.info.bind { (info) in
            self.balanceLabel.text = String(format: "$%d", info?.amount ?? 0)
            self.nameLabel.text = info?.firstName
        }
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(hex: "#003D9A")
        setupUI()
    }
    
    func setupUI() {
        // container
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let topHeader = UIView()
        topHeader.translatesAutoresizingMaskIntoConstraints = false
        
        let logo = UIImageView(image: UIImage(named: "Logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        let avatar = UIImageView(image: UIImage(named: "avatar"))
        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setFont(type: .Normal, size: 14)
        nameLabel.textColor = .white
        topHeader.addSubview(logo)
        topHeader.addSubview(avatar)
        topHeader.addSubview(nameLabel)
        
        let label1 = UILabel()
        label1.text = "Available Balance"
        label1.textColor = .white
        label1.setFont(type: .Bold, size: 16)
        
        let balanceView = UIView()
        balanceView.backgroundColor = .white
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        balanceView.layer.cornerRadius = 10
        
        balanceLabel = UILabel()
        balanceLabel.textColor = UIColor(hex: "#003D9A")
        balanceLabel.setFont(type: .Bold, size: 32)
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceView.addSubview(balanceLabel)
        
        let stackBtn = UIStackView()
        stackBtn.axis = .horizontal
        let topupBtn = UIButton(type: .custom)
        topupBtn.setImage(UIImage(named: "Top Up"), for: .normal)
        topupBtn.addTarget(self, action: #selector(topUpMoney), for: .touchUpInside)
        let sendMoneyBtn = UIButton(type: .custom)
        sendMoneyBtn.setImage(UIImage(named: "Send Money"), for: .normal)
        stackBtn.addArrangedSubview(topupBtn)
        stackBtn.addArrangedSubview(sendMoneyBtn)
        
        let stackInfo = UIStackView()
        stackInfo.axis = .horizontal
        stackInfo.spacing = 20
        let daysLeftBorder = UIView()
        daysLeftBorder.translatesAutoresizingMaskIntoConstraints = false
        daysLeftBorder.layer.cornerRadius = 10
        daysLeftBorder.layer.borderWidth = 1
        daysLeftBorder.layer.borderColor = UIColor.white.cgColor
        let daysLeftView = UIStackView()
        daysLeftView.axis = .vertical
        daysLeftView.distribution = .fillEqually
        daysLeftView.translatesAutoresizingMaskIntoConstraints = false
        daysLeftBorder.addSubview(daysLeftView)
        let daysLeftLabel1 = UILabel()
        daysLeftLabel1.text = "28"
        daysLeftLabel1.textAlignment = .center
        daysLeftLabel1.setFont(type: .Bold, size: 28)
        daysLeftLabel1.textColor = .white
        daysLeftView.addArrangedSubview(daysLeftLabel1)
        let daysLeftLabel2 = UILabel()
        daysLeftLabel2.text = "Days\nLeft"
        daysLeftLabel2.numberOfLines = 0
        daysLeftLabel2.textAlignment = .center
        daysLeftLabel2.lineBreakMode = .byWordWrapping
        daysLeftLabel2.setFont(type: .Normal, size: 10)
        daysLeftLabel2.textColor = .white
        daysLeftView.addArrangedSubview(daysLeftLabel2)
        stackInfo.addArrangedSubview(daysLeftBorder)
        
        let stackCompletedTask = UIStackView()
        stackCompletedTask.axis = .vertical
        stackCompletedTask.spacing = 16
        let label2 = UILabel()
        label2.numberOfLines = 0
        label2.text = "Top up your account now and get the remaining $900"
        label2.setFont(type: .Bold, size: 14)
        label2.textColor = .white
        stackCompletedTask.addArrangedSubview(label2)
        let label3 = UILabel()
        label3.text = "1/8 Tasks Completed"
        label3.setFont(type: .Normal, size: 14)
        label3.textColor = .white
        stackCompletedTask.addArrangedSubview(label3)
        let trackImg = UIImageView(image: UIImage(named: "Trackbar"))
        stackCompletedTask.addArrangedSubview(trackImg)
        stackInfo.addArrangedSubview(stackCompletedTask)
        
        stack.addArrangedSubview(topHeader)
        stack.addArrangedSubview(label1)
        stack.addArrangedSubview(balanceView)
        stack.addArrangedSubview(stackBtn)
        stack.addArrangedSubview(stackInfo)
        stack.addArrangedSubview(UIView())
        view.addSubview(stack)
        
        stack.setCustomSpacing(27, after: logo)
        stack.setCustomSpacing(16, after: balanceView)
        stack.setCustomSpacing(16, after: stackBtn)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logo.topAnchor.constraint(equalTo: topHeader.topAnchor, constant: 2),
            logo.heightAnchor.constraint(equalToConstant: 40),
            logo.centerXAnchor.constraint(equalTo: topHeader.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: topHeader.topAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 32),
            avatar.widthAnchor.constraint(equalToConstant: 32),
            topHeader.heightAnchor.constraint(equalToConstant: 70),
            nameLabel.trailingAnchor.constraint(equalTo: topHeader.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor),
            avatar.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            balanceView.heightAnchor.constraint(equalToConstant: 72),
            balanceLabel.centerYAnchor.constraint(equalTo: balanceView.centerYAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor, constant: 20),
            daysLeftView.topAnchor.constraint(equalTo: daysLeftBorder.topAnchor, constant: 10),
            daysLeftView.bottomAnchor.constraint(equalTo: daysLeftBorder.bottomAnchor, constant: -10),
            daysLeftView.leadingAnchor.constraint(equalTo: daysLeftBorder.leadingAnchor),
            daysLeftView.trailingAnchor.constraint(equalTo: daysLeftBorder.trailingAnchor),
        ])
    }
    
    @objc func topUpMoney(sender: UIButton!) {
        let alert = UIAlertController(title: "Top Up", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Amount"
            textField.keyboardType = .numberPad
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let value = Int(alert.textFields?.first?.text ?? "0") {
                self.viewModel.updateAmount(amount: value)
            }
        }))
        
        self.present(alert, animated: true)
    }
}

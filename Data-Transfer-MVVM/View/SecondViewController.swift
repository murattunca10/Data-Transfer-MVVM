//
//  SecondViewController.swift
//  Data-Transfer-MVVM
//
//  Created by Murat Tunca on 10.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let viewModel: SecondViewModel
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    // Dependency Injection ile ViewModel'i alıyoruz
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) kullanımı desteklenmiyor")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kullanıcı Detayı"
        view.backgroundColor = .white
        setupLabels()
        bindViewModel()
    }
    
    private func setupLabels() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func bindViewModel() {
        nameLabel.text = "İsim: \(viewModel.user.name)"
        emailLabel.text = "Email: \(viewModel.user.email)"
    }
}


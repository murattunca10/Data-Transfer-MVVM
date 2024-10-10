//
//  FirstViewController.swift
//  Data-Transfer-MVVM
//
//  Created by Murat Tunca on 10.10.2024.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let viewModel = FirstViewModel()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kullanıcılar"
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func bindViewModel() {
        viewModel.navigateToSecondView = { [weak self] in
            self?.navigateToSecondPage()
        }
    }
    
    private func navigateToSecondPage() {
        guard let selectedUser = viewModel.selectedUser else { return }
        let secondVM = SecondViewModel(user: selectedUser)
        let secondVC = SecondViewController(viewModel: secondVM)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: - UITableViewDataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectUser(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

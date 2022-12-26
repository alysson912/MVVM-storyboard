//
//  ViewController.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        self.viewModel.delegate(delegate: self)
    }
    
    func configTableView(){
        tableView.separatorStyle = .none
        self.viewModel.delegate(delegate: self)
        self.viewModel.fetchAllRequest()
        // registerCell
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configCell(user: self.viewModel.loadCurrentUser(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.heightForRowAt
    }
}

extension ViewController : ViewModelDelegate{
    func successRequest() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func errorRequest() {
        print("erro ao realizar request")
    }
}

//
//  ViewController.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit

class ViewController: UIViewController {

    let viewModel: ViewModel = ViewModel() // criando referencia da viewModel
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        // registerCell
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configCell(data: self.viewModel.loadCurrentUser(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return print(self.viewModel.getName(indexPath: indexPath))
    }
}

//
//  ViewController.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var listUser: [Pessoa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configArrayUser()
       
    }

    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        // registerCell
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }
    
    func configArrayUser(){
        self.listUser.append(Pessoa(name: "Alysson", age: 25, profession: "IOS Developer", salary: 4.800, imageUser: UIImage(named: "Image-1") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Jessica", age: 29, profession: "IOS Developer", salary: 6.800, imageUser: UIImage(named: "Image-2") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Anderson", age: 29, profession: "IOS Developer", salary: 35.800, imageUser: UIImage(named: "Image-3") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Jessica", age: 29, profession: "IOS Developer", salary: 6.800, imageUser: UIImage(named: "Image-4") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Caio", age: 29, profession: "IOS Developer", salary: 25.800, imageUser: UIImage(named: "Image-5") ?? UIImage()))
    }
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configCell(data: self.listUser[ indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

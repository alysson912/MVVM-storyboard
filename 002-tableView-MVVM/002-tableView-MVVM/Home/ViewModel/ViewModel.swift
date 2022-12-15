//
//  ViewModel.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 15/12/22.
//

import UIKit

class ViewModel{

  private var listUser: [User] = []
    
    init(){
        configArrayUser()
    }
    
   private func configArrayUser(){
        self.listUser.append(User(name: "Alysson", age: 25, profetion: "IOS Developer", salary: 4.800, imageUser: UIImage(named: "Image-1") ?? UIImage()))
        self.listUser.append(User(name: "Jessica", age: 29, profetion: "IOS Developer", salary: 6.800, imageUser: UIImage(named: "Image-2") ?? UIImage()))
        self.listUser.append(User(name: "Anderson", age: 29, profetion: "IOS Developer", salary: 35.800, imageUser: UIImage(named: "Image-3") ?? UIImage()))
        self.listUser.append(User(name: "Jessica", age: 29, profetion: "IOS Developer", salary: 6.800, imageUser: UIImage(named: "Image-4") ?? UIImage()))
        self.listUser.append(User(name: "Caio", age: 29, profetion: "IOS Developer", salary: 25.800, imageUser: UIImage(named: "Image-5") ?? UIImage()))
    }
    
    var numberOfRowsInSection : Int{
        return listUser.count
    }
    
    public func loadCurrentUser ( indexPath : IndexPath) -> User{
        return listUser[ indexPath.row]
    }
    
    var heightForRowAt : CGFloat {
        return 150
    }
}

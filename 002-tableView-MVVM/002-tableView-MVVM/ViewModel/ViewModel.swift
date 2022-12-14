//
//  ViewModel.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit

class ViewModel {

  private var listUser: [Pessoa] = []
    
    init(){
        self.configArrayUser()
    }
    
  private func configArrayUser(){
        self.listUser.append(Pessoa(name: "Alysson", age: 25, profession: "IOS Developer", salary: "4.800", imageUser: UIImage(named: "Image-1") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Jessica", age: 29, profession: "IOS Developer", salary: "6.800", imageUser: UIImage(named: "Image-2") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Anderson", age: 29, profession: "IOS Developer", salary: "35.800", imageUser: UIImage(named: "Image-3") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Jessica", age: 29, profession: "IOS Developer", salary: "6.800", imageUser: UIImage(named: "Image-4") ?? UIImage()))
        self.listUser.append(Pessoa(name: "Caio", age: 29, profession: "IOS Developer", salary: "25.800", imageUser: UIImage(named: "Image-5") ?? UIImage()))
    }
    
 
    // variavel computada para armazenar a quantidade de elementos dentro do array
    public var numberOfRowsInSection: Int{
        return self.listUser.count
    }
    // variavel para armazenar a altura da celula
    public var heightForRowAt : CGFloat {
      return 150
    }
    
    // criar funcao para retornar o objeto pessoa
    public func loadCurrentUser(indexPath : IndexPath) -> Pessoa{
        return self.listUser[ indexPath.row]
    }
    
    // pegar o nome ao clicar na cell
    public func getName(indexPath : IndexPath) -> String{
        return self.listUser[ indexPath.row].name
    }
}

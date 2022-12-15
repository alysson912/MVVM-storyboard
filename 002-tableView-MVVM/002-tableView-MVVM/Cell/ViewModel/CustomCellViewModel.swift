//
//  CustomCellViewModel.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 15/12/22.
//

import UIKit
enum DescriptionCustomCell : String{
    case name = "Nome: "
    case age = "Idade: "
    case profetion = "Profissão: "
    case salary = "Salário: "
}

class CustomCellViewModel{
    private var data : User
    
    init(data: User) {
        self.data = data
    }
    
    public var getName: String {
        return DescriptionCustomCell.name.rawValue + self.data.name
    }
    public  var getAge: String {
        return DescriptionCustomCell.age.rawValue + String(self.data.age)
    }
    public var getProfetion: String {
        return DescriptionCustomCell.profetion.rawValue + self.data.profetion
    }
    public var getSalary: String {
        return DescriptionCustomCell.salary.rawValue + String(self.data.salary)
    }
    public var getImage: String {
        return self.data.imageUser
    }
}

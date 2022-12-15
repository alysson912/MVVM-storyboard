//
//  Pessoa.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit


struct UserResult: Codable {
    var group : [User]
}

struct User : Codable {
    var name : String
    var age : Int
    var profetion : String
    var salary : String
    var imageUser: String
}

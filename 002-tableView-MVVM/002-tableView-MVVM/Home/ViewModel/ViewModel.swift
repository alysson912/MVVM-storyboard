//
//  ViewModel.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 15/12/22.
//

import UIKit
protocol ViewModelDelegate : NSObject {
    func successRequest()
    func errorRequest()
}

class ViewModel{
    private let service : Service = Service()
    private var listUser: [User] = []
    
    private weak var delegate : ViewModelDelegate?
    
    public func delegate( delegate: ViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func fetchAllRequest(){
        service.getUserFromJson(fromFileNamed: "user"){ success, error in
            if let _success = success{
                self.listUser = _success.group
                self.delegate?.successRequest()
            }else {
                self.delegate?.errorRequest()
            }
        }
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

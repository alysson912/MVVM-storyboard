//
//  Service.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 15/12/22.
//

import UIKit
import Alamofire
protocol GenericService : AnyObject {
    typealias completion <T> = (_ result: T,_ faiure: Error?) -> Void
}
enum Error : Swift.Error{
    case fileNotFound( name: String)
    case fileDecodingFailed( name: String, Swift.Error)
}
protocol ServiceDelegate: GenericService{
    func getUserFromJson( fromFileNamed name: String, completion: @escaping completion<UserResult?>)
}

class Service: ServiceDelegate {
    // funcao para fazer leitura do json
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json")else { return completion( nil, Error.fileNotFound(name: name))}
        
        do {
            let data = try Data(contentsOf: url)
            let user = try JSONDecoder().decode(UserResult.self, from: data)
            completion(user, nil)
        } catch  {
            completion(nil, Error.fileDecodingFailed(name: name, error))
        }
    }
}

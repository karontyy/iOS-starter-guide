//
//  AlunoAPI.swift
//  Pokedex
//
//  Created by Guilherme Berson on 29/04/21.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
    
    var URL_BASE = "http://localhost:8080/api"

    
    //MARK: - POST
    
    func salvaAlunosNoServidor(parametros:Dictionary<String, String>) {
        AF.request(URL_BASE + "/aluno", method: .post, parameters: parametros, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { (response) in
                print(response)
            }
    }
}

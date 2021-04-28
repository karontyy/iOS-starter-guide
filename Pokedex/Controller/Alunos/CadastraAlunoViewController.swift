//
//  CadastraAlunoViewController.swift
//  Pokedex
//
//  Created by Guilherme Berson on 28/04/21.
//

import UIKit
import Alamofire
class CadastraAlunoViewController: UIViewController {

    var URL_BASE = "http://localhost:8080/api"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aluno:Dictionary<String, String> = [
            "id" : String(describing: UUID()),
            "nome" : "Jhon Doe",
            "endereco" : "9 Avenue",
            "telefone" : "9 9999 9999",
            "site" : "facebook.com",
            "nota" : "6"
        ]
        
        AF.request(URL_BASE + "/aluno", method: .post, parameters: aluno, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { (response) in
                print(response)
            }
    }
}

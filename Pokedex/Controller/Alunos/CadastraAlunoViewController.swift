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

    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func montaDicionarioDeParametros() -> Dictionary<String, String> {
        guard let nome = textFieldNome.text else { return [:] }
        guard let endereco = textFieldEndereco.text else { return [:] }
        guard let telefone = textFieldTelefone.text else { return [:] }
        guard let site = textFieldSite.text else { return [:] }
        guard let nota = textFieldNota.text else { return [:] }
        
        let dicionario:Dictionary<String, String> = [
            "id" : String(describing: UUID()),
            "nome" : nome,
            "endereco" : endereco,
            "telefone" : telefone,
            "site" : site,
            "nota" : nota
        ]
        
        return dicionario
    }
    
    @IBAction func buttonSalvar(_ sender: UIButton) {
        let json = montaDicionarioDeParametros()
        Repositorio().salvaAluno(aluno: json)
        navigationController?.popViewController(animated: true)
    }
    
   
}

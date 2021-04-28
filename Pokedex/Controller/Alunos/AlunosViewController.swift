//
//  AlunosViewController.swift
//  Pokedex
//
//  Created by Guilherme Berson on 28/04/21.
//

import UIKit
import Alamofire

class AlunosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var alunoTableView: UITableView!
    @IBOutlet weak var btnNovo: UIButton!

    var URL_BASE = "http://localhost:8080/api"
    var items: [Aluno] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "AlunoTableViewCell", bundle: nil)
        alunoTableView.register(nib, forCellReuseIdentifier: "AlunoTableViewCell")

        
        //Para as funções da tableview
        alunoTableView.delegate = self
        alunoTableView.dataSource = self
        
        
        fetchAlunos()
        
        
        btnNovo.addTarget(self, action: #selector(clickBtnNovo), for: .touchUpInside)

    }
    
    
    //MARK: - FUNCS
    func fetchAlunos(){
        AF.request(URL_BASE + "/aluno")
            .validate()
            .responseDecodable(of: Alunos.self) { (response) in
                guard let alunos = response.value else { return }
                self.items = alunos.alunos
                self.alunoTableView.reloadData()
        }
    }
    
    @objc func clickBtnNovo(){
        let cadastraAlunoViewController = storyboard?.instantiateViewController(identifier: "novoAluno") as! CadastraAlunoViewController
        navigationController?.pushViewController(cadastraAlunoViewController, animated: true)
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlunoTableViewCell", for: indexPath) as! AlunoTableViewCell
        let item = items[indexPath.row]
        cell.nome.text = item.nome
        cell.tel.text = item.telefone
        return cell
    }

}

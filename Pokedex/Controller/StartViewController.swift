//
//  StartViewController.swift
//  Pokedex
//
//  Created by Guilherme Berson on 28/04/21.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var btnPokedex: UIButton!
    @IBOutlet weak var btnAlunos: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu de Apps"
        
        btnPokedex.addTarget(self, action: #selector(clickBtnPokedex), for: .touchUpInside)
        btnAlunos.addTarget(self, action: #selector(clickBtnAlunos), for: .touchUpInside)
    }
    
    
    @objc func clickBtnPokedex(){
        let viewController = storyboard?.instantiateViewController(identifier: "pokedexList") as! ViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func clickBtnAlunos(){
        let alunosViewController = storyboard?.instantiateViewController(identifier: "alunosHome") as! AlunosViewController
        navigationController?.pushViewController(alunosViewController, animated: true)
    }

}

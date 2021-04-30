//
//  Repository.swift
//  Pokedex
//
//  Created by Guilherme Berson on 29/04/21.
//

import UIKit

class Repository: NSObject {
    func salvaAluno(aluno:Dictionary<String, String>) {
        AlunoAPI().salvaAlunoAPI(aluno: [aluno])
    }
}

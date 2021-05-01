//
//  Repositorio.swift
//  Pokedex
//
//  Created by Guilherme Berson on 29/04/21.
//

import UIKit

class Repositorio: NSObject {
    func salvaAluno(aluno:Dictionary<String, String>) {
        AlunoAPI().salvaAlunosNoServidor(parametros: aluno)
    }
    
    func excluiAluno(alunoId:String) {
        AlunoAPI().excluiAlunodoServidor(alunoId: alunoId)
    }
}

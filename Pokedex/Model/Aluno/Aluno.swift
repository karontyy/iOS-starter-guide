//
//  Aluno.swift
//  Pokedex
//
//  Created by Guilherme Berson on 28/04/21.
//

import Foundation

struct Aluno: Codable {
    let id, nome, endereco, telefone: String
    let site: String
    let nota, desativado, idCliente: Int
}

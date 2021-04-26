//
//  DetailPokemon.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import Foundation

struct DetailPokemon: Decodable {
  let sprites: ImgType
  
  enum CodingKeys: String, CodingKey {
    case sprites
  }
}

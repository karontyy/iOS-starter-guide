//
//  ImgType.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import Foundation

import Foundation

struct ImgType: Decodable {
  let front_default: String
  
  enum CodingKeys: String, CodingKey {
    case front_default
  }
}

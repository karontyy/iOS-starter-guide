//
//  Result.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import Foundation

struct Result: Decodable {
  let name: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case url
  }
}

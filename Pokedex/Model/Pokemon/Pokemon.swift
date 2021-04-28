//
//  Pokemon.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import Foundation

struct Pokemon: Decodable {
  let count: Int
  let next: String
  let previous: String?
  let results: [Result]
  
  enum CodingKeys: String, CodingKey {
    case count
    case next
    case previous
    case results
  }
}

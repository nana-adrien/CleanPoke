//
//  PokemonResultDTO.swift
//  CleanPoke
//
//  Created by Digiprem on 27/01/2026.
//

import Foundation

struct PokemonResultItemDTO:Decodable{
    let name:String
    let url:String
}

struct PokemonResultDTO:Decodable{
    let count:Int
    let next:String
    let results:[PokemonResultItemDTO]
}

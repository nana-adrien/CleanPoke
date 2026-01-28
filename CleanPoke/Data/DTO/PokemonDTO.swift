//
//  PokemonDTO.swift
//  CleanPoke
//
//  Created by Digiprem on 27/01/2026.
//

import Foundation

struct PokemonDTO:Decodable{
    let id:Int
    let name:String
    let height:Int
    let weight:Int
}

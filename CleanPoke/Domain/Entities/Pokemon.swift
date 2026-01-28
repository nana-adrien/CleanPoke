//
//  Pokemon.swift
//  CleanPoke
//
//  Created by Digiprem on 27/01/2026.
//

import Foundation

struct Pokemon:Identifiable{
    let id=UUID()
    let name:String
    let url:String
    let weight:Int
    let height:Int
    
    var imageURL:String{
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
    }
}

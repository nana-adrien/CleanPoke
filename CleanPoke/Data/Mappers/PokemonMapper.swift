//
//  PokemonMapper.swift
//  CleanPoke
//
//  Created by Digiprem on 27/01/2026.
//

import Foundation

class  PokemonMapper{
	
	static func map(pokemonResultItemDTO:PokemonResultItemDTO,pokemonDTO:PokemonDTO)->Pokemon{
		
		return Pokemon(
			name: pokemonDTO.name,
			url: pokemonResultItemDTO.url,
			weight: pokemonDTO.weight,
			height: pokemonDTO.height
		)
	}
}

//
//  GetAllPokemonUseCase.swift
//  CleanPoke
//
//  Created by Digiprem on 28/01/2026.
//

import Foundation


class GetAllPokemonUseCase{
	
	let pokemonRepository=PokemonRepository()
	func execute(offset:Int,limit:Int) async throws ->[Pokemon]{
		return try await pokemonRepository.getPokemon(offset: offset, limit: limit)
	}
}

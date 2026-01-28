//
//  PokemonRepository.swift
//  CleanPoke
//
//  Created by Digiprem on 28/01/2026.
//

import Foundation

class PokemonRepository{
	
	let datasource=PokemonApiDataSource()
	
	func getPokemon( offset: Int,limit: Int) async throws ->[Pokemon]{
		do{
			let pokemonListDTO = try await  datasource.getPokemons(offset: offset, limit: limit)
			
			var pokemons:[Pokemon] = []
			for pokemonResultItemDTO in pokemonListDTO.results {
				let pokemonId=pokemonResultItemDTO.url.split(separator: "/").last ?? "1"
				
				let pokemonDTO = try await datasource.getPokemonDetails(id:String(pokemonId) )
				
				let newPokemon=PokemonMapper.map(pokemonResultItemDTO:pokemonResultItemDTO, pokemonDTO: pokemonDTO)
				pokemons.append(newPokemon)
			}
			return pokemons
			
		} catch{
			throw error
		}
	}
}

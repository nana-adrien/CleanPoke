//
//  PokemonViewModel.swift
//  CleanPoke
//
//  Created by Digiprem on 28/01/2026.
//

import Foundation
import Combine

@MainActor
class PokemonListViewModel: ObservableObject {
	
	@Published var pokemons: [Pokemon] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: String? = nil
	
	
	private let getAllPokemonUseCase=GetAllPokemonUseCase()
	
	
	func loadPokemons(offset:Int,limit:Int) async{
		isLoading=true
		errorMessage=nil
		do{
			let result=try await getAllPokemonUseCase.execute(offset: offset, limit: limit)
			self.pokemons=result
		}catch{
			print(error)
			errorMessage="une erreur est survenue :\(error.self)"
		}
		isLoading=false
	}
	
}

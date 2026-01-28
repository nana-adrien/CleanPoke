//
//  PokemonApiDataSource.swift
//  CleanPoke
//
//  Created by Digiprem on 27/01/2026.
//

import Foundation

enum PokemonApiDataSourceError:Error{
    case invalidURL
    case invalidResponse
    case parsingError
}

class PokemonApiDataSource{
    
    
    func getPokemons(offset:Int,limit:Int) async throws -> PokemonResultDTO{
        guard let url=URL(string:"https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)") else{
            throw PokemonApiDataSourceError.invalidURL
        }
        
      let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response=response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonApiDataSourceError.invalidResponse
        }
        
        do{
            let result = try JSONDecoder().decode(PokemonResultDTO.self, from: data)
            return result
        }catch{
            throw PokemonApiDataSourceError.parsingError
        }
        
    }
    
    func getPokemonDetails(id:String) async throws -> PokemonDTO{
        
        guard let
                url = URL(string:"https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            throw PokemonApiDataSourceError.invalidURL
        }
            
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse , response.statusCode==200 else{
	
			throw PokemonApiDataSourceError.invalidResponse
        }
        
        do{
			let pokemonDTO = try JSONDecoder().decode(PokemonDTO.self, from: data)
            return pokemonDTO
        } catch{
			print(error)
            throw PokemonApiDataSourceError.parsingError
        }
        
    }
}

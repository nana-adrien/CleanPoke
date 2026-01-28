//
//  PokemonListView.swift
//  CleanPoke
//
//  Created by Digiprem on 28/01/2026.
//

import SwiftUI

struct PokemonListView: View{
@StateObject var  viewModel=PokemonListViewModel()
	
	var body: some View{
		NavigationView{
			HStack{
				if(viewModel.isLoading){
					ProgressView("Chargement...")
				} else if let error=viewModel.errorMessage{
					Button{
						Task{
							await viewModel.loadPokemons(offset: 0, limit: 20)
						}
					} label:{
						Text(error)
							.foregroundColor(.red)
							.multilineTextAlignment(.center)
							.padding()

					}
				}else{
					List(viewModel.pokemons){pokemon in
						HStack{
							AsyncImage(url:URL(string:pokemon.imageURL)){image in
								image
									.resizable()
									.scaledToFit()
									.frame(width: 60,height: 60)
								
							} placeholder:{
								ProgressView()
							}
							
							VStack(alignment: .leading){
								Text(pokemon.name.capitalized)
									.font(.headline)
								Text("Taille :\(pokemon.height),Poids :\(pokemon.weight)")
									.font(.subheadline)
									.foregroundColor(.gray)
							}
						}
						
					}
				}
				
				
			}
			.navigationTitle("Pokemons")
			.task {
				await viewModel.loadPokemons(offset: 0, limit: 20)
			}
			
			
		}
		
		
	}
}

struct PokemonListView_Preview:PreviewProvider{
	static var previews: some View{
		PokemonListView()
	}
}


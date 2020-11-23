//
//  PokedexView.swift
//  PokedexSwifttUI
//
//  Created by Oscar Rodriguez Garrucho on 23/11/20.
//

import SwiftUI
import KingfisherSwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    @State var showFilterButtons = false
    @State var filterApplied = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        let dataSource = filterApplied ? viewModel.filteredPokemon : viewModel.pokemon
                        ForEach(dataSource) { pokemon in
                            NavigationLink(
                                destination: NavigationLazyView(PokemonDetailView(pokemon: pokemon)),
                                label: {
                                    PokemonCell(pokemon: pokemon)
                                        .frame(width: 220, height: 108)
                                        .padding(.horizontal)
                                })
                        }
                    }
                }
                .navigationBarTitle("Pokemon")
                .onAppear {
                    viewModel.fetchPokemon()
                }

                VStack {
                    if showFilterButtons {
                        ActionButton(imageName: "fire", backgroundColor: .red, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterPokemon(by: "fire")
                        }
                        ActionButton(imageName: "leaf", backgroundColor: .green, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterPokemon(by: "poison")

                        }
                        ActionButton(imageName: "water", backgroundColor: .blue, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterPokemon(by: "water")

                        }
                        ActionButton(imageName: "lightning", backgroundColor: .yellow, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            viewModel.filterPokemon(by: "electric")
                        }
                    }

                    let imageName = filterApplied ? "refresh" : "filter"
                    ActionButton(imageName: imageName, height: 36, width: 36, show: $showFilterButtons) {
                        filterApplied ? filterApplied.toggle() : showFilterButtons.toggle()
                    }.rotationEffect(.init(degrees: self.showFilterButtons ? 180 : 0))

                }
                .padding()
                .animation(.spring())
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

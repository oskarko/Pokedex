//
//  Pokemon.swift
//  PokedexSwifttUI
//
//  Created by Oscar Rodriguez Garrucho on 23/11/20.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
    let type: String
    var evolutionChain: [EvolutionChain]?
}

enum Type: String, Decodable {
    case poison
    case fire
    case water
    case flying
}

struct EvolutionChain: Decodable {
    let id: String?
    let name: String?
}

let SAMPLE_POKEMON = Pokemon(id: 1,
                             name: "Bulbasaur",
                             imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
                             description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
                             height: 7,
                             weight: 69,
                             attack: 49,
                             defense: 49,
                             type: "Poison",
                             evolutionChain: nil)

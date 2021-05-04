//
//  Card.swift
//  Deck_of_One_Card
//
//  Created by Lizzie Ferguson on 5/4/21.
//

import Foundation

struct Deck: Decodable {
    let cards: [Card]
    
}
struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
    
    }

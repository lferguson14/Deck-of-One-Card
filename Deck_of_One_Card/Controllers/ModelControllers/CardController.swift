//
//  CardController.swift
//  Deck_of_One_Card
//
//  Created by Lizzie Ferguson on 5/4/21.
//

import UIKit

class CardController {
    
    static let baseURL = URL(string: "http://deckofcardsapi.com/api/deck")
    static let cardPathComponent = "card"
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        let cardURL = baseURL.appendingPathComponent("new")
        let finalURL = cardURL.appendingPathComponent("draw")
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let deck = try JSONDecoder().decode(Deck.self, from: data)
                let card = deck.cards.first!
                completion(.success(card))
            } catch {
                completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        
        let url = card.image
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
                
            }
            guard let data = data else {return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            completion(.success(image))
        }.resume()
    }
}

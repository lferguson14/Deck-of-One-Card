//
//  CardError.swift
//  Deck_of_One_Card
//
//  Created by Lizzie Ferguson on 5/4/21.
//

import UIKit

enum  CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Internal error. Please update Deck Of One Card."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "The servr responded with bad data"
      
        }
    }

}

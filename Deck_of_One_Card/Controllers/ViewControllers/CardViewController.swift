//
//  CardViewController.swift
//  Deck_of_One_Card
//
//  Created by Lizzie Ferguson on 5/4/21.
//

import UIKit

class CardViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                case .success(let card):
                    self.nameLabel.text = "\(card.value) of \(card.suit)"
                    CardController.fetchImage (for: card) { (imageResult) in
                        DispatchQueue.main.async {
                            switch imageResult {
                            case .failure(let error):
                                self.presentErrorToUser(localizedError: error)
                            case .success(let image):
                                self.cardImageView.image = image
                        }
                    }
                }
            }
        }
    }
}
}

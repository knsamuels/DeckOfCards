//
//  CardViewController.swift
//  DeckOfOneCard34
//
//  Created by Kristin Samuels  on 6/16/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    // Mark: Outlets
    
    @IBOutlet var valueAndSuitLabel: UILabel!
    @IBOutlet var cardImage: UIImageView!
    //Mark Lifecycles
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

// mark: Methods
    func fetchImageAndUpdateViews(for card: Card){
        CardController.fetchImage(for: card) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.cardImage.image = image
                    self?.valueAndSuitLabel.text = "\(card.value) of \(card.suit)"
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self](result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}

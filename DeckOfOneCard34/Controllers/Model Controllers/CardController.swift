//
//  CardController.swift
//  DeckOfOneCard34
//
//  Created by Kristin Samuels  on 6/16/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

class CardController {
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        // 1 - Prepare URL
        guard let baseURL = URL(string:"https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {return completion(.failure(.invaildURL))}
        // 2 - Contact server
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            // 3 - Handle errors from the server
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Check for json data
            guard let data = data else {return completion(.failure(.noData))}
                  // 5 - Decode json into a Card
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let card = topLevelObject.cards[0]
                return completion(.success(card))
            } catch {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
  
    static func fetchImage( for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        // 1 - Prepare URL
        let finalURL = card.image
        // 2 - Contact server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
             // 3 - Handle errors from the server
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Check for json data
            guard let data = data else {return completion(.failure(.noData))}
                   // 5 - Decode json into a Card
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            return completion(.success(image))
        }.resume()
    }
}

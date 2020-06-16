//
//  CardError.swift
//  DeckOfOneCard34
//
//  Created by Kristin Samuels  on 6/16/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import Foundation


enum CardError: LocalizedError {
    case invaildURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription : String? {
        switch self {
        case .invaildURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}


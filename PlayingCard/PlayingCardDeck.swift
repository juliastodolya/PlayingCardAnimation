//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Юлия on 14.01.2021.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards: [PlayingCard​] = []
    
    mutating func draw() -> PlayingCard​? {
        if cards.count > 0 {
            return cards.remove(at: Int.random(in: 0..<cards.count))
        } else {
            return nil
        }
    }
    
    init() {
        for suit in PlayingCard​.Suit.allCases {
            for rank in PlayingCard​.Rank.all {
                cards.append(PlayingCard​(suit: suit, rank: rank))
            }
        }
    }
    
}


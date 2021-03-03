//
//  EmojiMemoryGame.swift
//  cardGame
//
//  Created by Szymon Trombik on 25/02/2021.
//

import Foundation

// viewmodel

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🍕", "😏", "🤣", "🌯"]
        return MemoryGame.init(numberOfPairsOfCards: emojis.count) { index in
            return emojis[index]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

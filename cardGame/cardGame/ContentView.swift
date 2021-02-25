//
//  ContentView.swift
//  cardGame
//
//  Created by Szymon Trombik on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    
    var body: some View {
        HStack {
            LazyVGrid (columns: columns, spacing: 5) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.blue)
        .font(.title)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        if(card.isFaceUp) {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 5)
                RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.white)
                Text(card.content)
            }
            .frame(height: 60)
            .padding()
        } else
        {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill()
                Text("?").foregroundColor(Color.white)
            }
            .frame(height: 60)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

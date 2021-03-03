//
//  ContentView.swift
//  cardGame
//
//  Created by Szymon Trombik on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    self.viewModel.choose(card: card)
                })
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
        GeometryReader { geometry in
            ZStack {
                if(card.isFaceUp) {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(lineWidth: self.lineWidth)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .foregroundColor(Color.white)
                    Text(card.content)
                }
                else {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill()
                }
            }
            .font(Font.system(size: min(geometry.size.height, geometry.size.width) * self.fontScaleFactor))
        }
    }
    
    // MARK: Drawing constants
    
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

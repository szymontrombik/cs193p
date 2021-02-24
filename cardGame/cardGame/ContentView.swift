//
//  ContentView.swift
//  cardGame
//
//  Created by Szymon Trombik on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach ( 0..<4 ) { index in
                CardView()
            }
        }
        .padding()
        .foregroundColor(Color.blue)
        .font(.title)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        if(isFaceUp) {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 5)
                RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.white)
                Text("🍕")
            }
        } else
        {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill()
                Text("?").foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

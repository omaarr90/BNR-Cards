//
//  CardDeckView.swift
//  Cards
//
//  Created by Omar Alshammari on 13/05/2024.
//

import SwiftUI

struct CardDeckView: View {
    
    var cards: [Card]
    
    var body: some View {
        TabView {
            ForEach(
                cards
            ) { card in
                CardView(
                    card: card
                )
            }
        }
        .tabViewStyle(
            .page
        )
        .background(
            Color.gray
        )
    }
}

#Preview {
    let cards = [
        Card(
            front: "What is 7+7?",
            back: "14", frontColor: .orange, backColor: .cyan
        ),
        Card(
            front: "What is the airspeed velocity of an unladen swallow?",
            back:
                "African or European?", frontColor: .orange, backColor: .cyan
        ),
        Card(
            front: "From what is cognac made?",
            back: "Grapes", frontColor: .orange, backColor: .cyan
        ),
    ]
    
    return CardDeckView(
        cards: cards
    )
}

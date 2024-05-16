//
//  ContentView.swift
//  Cards
//
//  Created by Omar Alshammari on 12/05/2024.
//

import SwiftUI

struct ContentView: View {
            
    @State var cards = [
    Card(front: "What is 7+7?", back: "14", frontColor: .orange, backColor: .cyan),
    Card(front: "What is the airspeed velocity of an unladen swallow?", back: "African or European?", frontColor: .orange, backColor: .cyan),
    Card(front: "From what is cognac made?", back: "Grapes", frontColor: .orange, backColor: .cyan),]
    
    @State private var isShowingCreateCardView = false

    var body: some View {
        ZStack {
            CardDeckView(cards: cards)
            
            Button {
                isShowingCreateCardView = true
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
                    .padding()
                    .background(Color.orange)
                    .clipShape(Circle())
            }
            .padding([.top, .trailing])
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .sheet(isPresented: $isShowingCreateCardView) {
            CreateCardView() { card in
                cards.append(card)
            }
                .environment(\.textCase, .uppercase)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

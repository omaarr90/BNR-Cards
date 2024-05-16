//
//  CardView.swift
//  Cards
//
//  Created by Omar Alshammari on 13/05/2024.
//

import SwiftUI

struct Card: Identifiable {
    var front: String
    var back: String
    var frontColor: Color
    var backColor: Color
    var id = UUID()
}

struct CardView: View {
    
    var card: Card
    
    @State private var isBackVisible = false
    private var degrees: Double {
        isBackVisible ? 180 : 0
    }
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion: Bool
    
    var body: some View {
        ZStack {
            Group {
                Text(card.back)
                    .scaleEffect(x: -1)
                    .opacity(isBackVisible ? 1 : 0)
                
                Text(card.front)
                    .opacity(isBackVisible ? 0 : 1)
            }
            .font(.system(size: 24))
            .bold()
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            Button {
                if reduceMotion {
                    isBackVisible.toggle()
                } else {
                    withAnimation {
                        isBackVisible.toggle()
                    }
                }
            } label: {
                Image(systemName: "arrow.left.arrow.right.circle.fill")
                    .font(.system(size: 32))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding()
        .frame(width: 300)
        .aspectRatio(4/3, contentMode: .fit)
        .background(isBackVisible ? card.backColor : card.frontColor)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
        .rotation3DEffect(
            .degrees(degrees),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    CardView(card: Card(front: "What is 7+7?",
                        back: "14", frontColor: .orange, backColor: .cyan))
}

#Preview {
    CardView(card: Card(front: "What is the airspeed velocity of an unladen swallow?",
                        back: "African or Europian", frontColor: .orange, backColor: .cyan))
}

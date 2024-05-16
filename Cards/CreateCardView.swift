//
//  CreateCardView.swift
//  Cards
//
//  Created by Omar Alshammari on 14/05/2024.
//

import SwiftUI

struct CreateCardView: View {
    
    enum FocusField {
        case front
        case back
    }
    
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @State var front = ""
    @State var back = ""
    @State var frontColor = Color.orange
    @State var backColor = Color.cyan
    
    @FocusState var focusedField: FocusField?
    
    var onCreate: (Card) -> Void
    
    var isValid: Bool {
        !front.isEmpty && !back.isEmpty
    }
    
    var body: some View {
        Form {
            Section(header: Text("Card Details")) {
                TextField("Front", text: $front)
                    .focused($focusedField, equals: .front)
                    .submitLabel(.next)
                TextField("Back", text: $back)
                    .focused($focusedField, equals: .back)
                    .submitLabel(.done)
            }
            
            Section(header: Text("Colors")) {
                ColorPicker("Front Color", selection: $frontColor)
                ColorPicker("Front Color", selection: $backColor)
            }
            
            Section {
                Button("Create") {
                    createCard()
                }
                .disabled(!isValid)
                
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .onSubmit {
            if front.isEmpty {
                focusedField = .front
            } else if back.isEmpty {
                focusedField = .back
            } else {
                createCard()
            }
        }
        .onAppear {
            focusedField = .front
        }
    }
    
    private func createCard() {
        guard isValid else { return }
        let card = Card(front: front, back: back, frontColor: frontColor, backColor: backColor)
        onCreate(card)
        dismiss()
    }
}

#Preview {
    CreateCardView(onCreate: { _ in })
        .textCase(.uppercase)
}

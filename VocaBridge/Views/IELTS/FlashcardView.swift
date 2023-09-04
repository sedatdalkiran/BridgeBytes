//
//  FlashcardView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 4.09.2023.
//

import SwiftUI

struct FlashCardView: View {
    let word: Word
    @State private var showDefinition: Bool = false

    var body: some View {
        ZStack {
            // Using a Color to fill the background
            Color.white.opacity(0.001) // Almost transparent, just to capture the tap
                .frame(width: 300, height: 200)

            VStack {
                if showDefinition {
                    Text(word.definition)
                        .transition(.flip)
                } else {
                    Text(word.word)
                        .transition(.flip)
                }
            }
        }
        .onTapGesture {
            withAnimation {
                showDefinition.toggle()
            }
        }
        .frame(width: 300, height: 200)
        .background(showDefinition ? Color.blue : Color.green)
        .foregroundColor(.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

extension AnyTransition {
    static var flip: AnyTransition {
        get {
            AnyTransition.asymmetric(insertion: .scale, removal: .opacity)
        }
    }
}

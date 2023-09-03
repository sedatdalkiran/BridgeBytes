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
        VStack {
            if showDefinition {
                Text(word.definition)
            } else {
                Text(word.word)
            }
        }
        .onTapGesture {
            showDefinition.toggle()
        }
    }
}

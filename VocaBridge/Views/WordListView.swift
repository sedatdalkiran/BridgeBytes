//
//  WordListView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 4.09.2023.
//

import SwiftUI

struct WordListView: View {
    var level: WordLevel

    var body: some View {
        List(level.words, id: \.word) { word in
            FlashCardView(word: word)
        }
        .navigationBarTitle("Words in Level \(level.id)", displayMode: .inline)
    }
}

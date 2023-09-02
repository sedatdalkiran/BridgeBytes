//
//  WordGroupView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI

struct WordGroupView: View {
    var words: [WordItem]

    var body: some View {
        List(words) { word in
            VStack(alignment: .leading) {
                Text(word.word).font(.headline)
                Text(word.definition).font(.subheadline)
            }
        }
    }
}

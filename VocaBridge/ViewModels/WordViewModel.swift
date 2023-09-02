//
//  WordViewModel.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI
import Foundation

class WordViewModel: ObservableObject {
    @Published var words: [WordItem] = []

    init() {
        self.words = APIService.load("1000EssentialWords.json", as: WordList.self).words
    }
}

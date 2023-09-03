//
//  IELTSViewModel.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 4.09.2023.
//

import SwiftUI
import Foundation
import Combine

class IELTSWordViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var progress: Double = 0.0

    var allLevels: [[Word]] {
        return Array(words.chunked(into: 10))
    }

    func words(forLevel level: Int) -> [Word] {
        guard level < allLevels.count else { return [] }
        return allLevels[level]
    }
    

    func loadWords() {
        if let url = Bundle.main.url(forResource: "1000EssentialWords", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let wordList = try JSONDecoder().decode(WordList.self, from: data)
                self.words = wordList.words
                print("Loaded words count: \(self.words.count)")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

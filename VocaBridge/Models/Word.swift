//
//  Words.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 4.09.2023.
//

import SwiftUI
import Foundation

struct WordList: Codable {
    let words: [Word]
}

struct Word: Codable, Identifiable {
    let id = UUID()
    let word: String
    let difficulty: Double
    let definition: String
}

struct WordLevel {
    var id: Int // Level Number
    var words: [Word]
}

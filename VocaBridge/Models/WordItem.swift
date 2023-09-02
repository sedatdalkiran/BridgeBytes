//
//  WordItems.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI
import Foundation

struct WordItem: Codable, Identifiable {
    var id: String { word }
    let word: String
    let difficulty: Double
    let definition: String
}

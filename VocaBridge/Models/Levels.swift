//
//  Levels.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 4.09.2023.
//

import SwiftUI

struct Level: Identifiable {
    var id = UUID()
    var range: ClosedRange<Double>
    var words: [Word]
    var isCompleted: Bool = false
}

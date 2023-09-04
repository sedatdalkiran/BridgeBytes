//
//  Array+Extensions.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//
import SwiftUI
import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

//
//  IELTSSectionView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI

struct IELTSSectionView: View {
    @ObservedObject var viewModel = WordViewModel()
    
    var body: some View {
        List(viewModel.words) { word in
            VStack(alignment: .leading) {
                Text(word.word).font(.headline)
                Text(word.definition).font(.subheadline)
            }
        }
    }
}

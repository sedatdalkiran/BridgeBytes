//
//  IELTSSectionView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI

struct IELTSSectionView: View {
    @ObservedObject var viewModel: WordViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.allLevelGroups, id: \.id) { levelGroup in
                    
                    // Progress bar for each level group
                    ProgressView("Progress \(levelGroup.id)", value: viewModel.completedLevelsForGroup(levelGroup.id), total: Double(levelGroup.levels.count))
                    
                    ForEach(levelGroup.levels, id: \.id) { level in
                        NavigationLink(destination: WordListView(level: level)) {
                            HStack {
                                Text("Level \(level.id)")
                                
                                Spacer()

                                // Checkbox
                                Image(systemName: viewModel.progress[level.id] ?? false ? "checkmark.square" : "square")
                                    .onTapGesture {
                                        viewModel.toggleProgress(for: level.id)
                                    }
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("IELTS Words", displayMode: .inline)
        }
    }
}


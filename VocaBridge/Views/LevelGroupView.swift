//
//  LevelGroupView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 5.09.2023.
//

import SwiftUI

struct LevelGroupView: View {
    var levelGroup: WordLevelGroup
    @ObservedObject var viewModel: WordViewModel

    var body: some View {
        List(levelGroup.levels, id: \.id) { level in
            NavigationLink(destination: WordListView(level: level)) {
                HStack(spacing: 20) {
                    
                    ZStack {
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: 50, height: 50)
                        
                        if viewModel.progress[level.id] == true {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "book.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                        }
                    }
                    .onTapGesture {
                        viewModel.toggleProgress(for: level.id)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Level \(level.id)")
                            .font(.headline)
                        
                        if let progress = viewModel.progress[level.id], progress == true {
                            Text("Completed")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        } else {
                            Text("In Progress")
                                .font(.subheadline)
                                .foregroundColor(.red)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .navigationBarTitle("Group \(levelGroup.id)", displayMode: .inline)
    }
}

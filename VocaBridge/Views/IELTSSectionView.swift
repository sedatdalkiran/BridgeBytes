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
                    
                    NavigationLink(destination: LevelGroupView(levelGroup: levelGroup, viewModel: viewModel)) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "folder.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                
                                Text("Group \(levelGroup.id)")
                                    .font(.headline)
                            }
                            
                            // Custom Progress Bar
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .frame(width: geometry.size.width, height: 8)
                                        .foregroundColor(Color.gray.opacity(0.2))
                                    
                                    Capsule()
                                        .frame(width: viewModel.completedLevelsForGroup(levelGroup.id) == Double(levelGroup.levels.count) ? geometry.size.width : CGFloat((viewModel.completedLevelsForGroup(levelGroup.id) / Double(levelGroup.levels.count)) * Double(geometry.size.width - 50)), height: 8)
                                        .foregroundColor(viewModel.completedLevelsForGroup(levelGroup.id) == Double(levelGroup.levels.count) ? .green : .red)
                                }
                            }
                            .frame(height: 8)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarTitle("IELTS Words", displayMode: .inline)
        }
    }
}

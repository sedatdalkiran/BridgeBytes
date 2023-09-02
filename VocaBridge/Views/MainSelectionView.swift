//
//  MainSelectionView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI

struct MainSelectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: IELTSSectionView()) {
                    Text("IELTS Section")
                }
                NavigationLink(destination: MathSectionView()) {
                    Text("Math Section")
                }
            }
        }
    }
}

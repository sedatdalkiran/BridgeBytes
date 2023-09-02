//
//  MainSelectionView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI

struct MainSelectionView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: IELTSSectionView()) {
                Text("IELTS Words")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            NavigationLink(destination: MathSectionView()) {
                Text("Math Dictionary")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

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
            VStack(spacing: 30) {
                NavigationLink(destination: IELTSSectionView(viewModel: WordViewModel())) {
                    Text("IELTS Section")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                // Add a similar button for Math section when ready
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct MainSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MainSelectionView()
    }
}

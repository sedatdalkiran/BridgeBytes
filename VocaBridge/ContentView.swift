//
//  ContentView.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 2.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainSelectionView()
            .navigationBarTitle("VocaBridge", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

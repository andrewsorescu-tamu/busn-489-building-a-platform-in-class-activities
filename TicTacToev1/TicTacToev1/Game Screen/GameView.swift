//
//  GameView.swift
//  TicTacToev1
//
//  Created by Sorescu, Andrew on 2/26/24.
//

import SwiftUI

struct GameView: View {
@Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("End Game"){
                        dismiss()
                    }.buttonStyle(.bordered)
                }
            } // end of toolbar
            .navigationTitle("Tic Tac Toe")
        } //end of navigationStack
    }
}

#Preview {
    GameView()
}

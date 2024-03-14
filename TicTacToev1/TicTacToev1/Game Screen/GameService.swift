//
//  GameService.swift
//  TicTacToev1
//
//  Created by Sorescu, Andrew on 2/26/24.
//

import Foundation

// An "ObservableObject" conformance allows instances of this class to be used inside views
class GameService: ObservableObject {
    // "@Published" allows us to create observable objects that automatically announce when changes occur
    // In simpler terms, whenever an object marked with "@Published" is changed, all views using that object will be reloaded to reflect those changes
    @Published var player1=player(gamePiece:.x,name:"Player1")
    @Published var player2=player(gamePiece:.o,name:"Player 2")
    @Published var possibleMoves=Moves.all
    
    @Published var gameOver=false
    
    var gameType=GameType.single
    
    var currentPlayer:player{
        if player1.isCurrent {
            return player1
        }
        else {
            return player2
        }
    }
    var gameStarted:Bool{
        player1.isCurrent || player2.isCurrent
    }
    
    var boardDisabled:Bool{
        gameOver || !gameStarted
    }
}

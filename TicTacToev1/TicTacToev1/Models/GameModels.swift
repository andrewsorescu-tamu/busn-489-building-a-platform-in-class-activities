//
//  GameModels.swift
//  TicTacToev1
//
//  Created by Sorescu, Andrew on 2/19/24.
//

import SwiftUI

// "enum" lets you define a new data type, and then define an EXCLUSIVE list of the possible values it can hold
enum GameType {
    case single, bot, peer, undetermined
    
    var description:String{
        switch self {
            //lowercase self is a current instance of the structure
            //uppercase Self is the structure itself
        case.single:
            return "Share your device and play against a friend."
        case.bot:
            return "Play against the device."
        case.peer:
            return "Invite someone near you with the app to play."
        case.undetermined:
            return ""
        }
    }
}

enum GamePiece:String {
    case x, o
    var image:Image{
        Image(self.rawValue)
    }
}

// a "struct" acts essentially as a class did in Python
struct player{
    let gamePiece:GamePiece
    var name:String
    var moves:[Int]=[]
    var isCurrent=false
    
    var isWinner:Bool{
            for moves in Moves.winningMoves{
                if moves.allSatisfy(self.moves.contains){
                    return true
                }
            }
            return false
        }
    }


enum Moves{
    static var all = [1,2,3,4,5,6,7,8,9]

    static var winningMoves = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

}

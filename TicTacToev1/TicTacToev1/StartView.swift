//
//  ContentView.swift
//  TicTacToev1
//
//  Created by Sorescu, Andrew on 2/19/24.
//

import SwiftUI

struct StartView: View {
    // let's create state properties to keep track of gametype, names of the users playing the game
    @State private var gameType:GameType = .undetermined
    @State private var yourName:String = ""
    @State private var opponentName:String = ""
    @FocusState private var focus:Bool
    //for the keyboard focus we want the keyboard to disappear when the game starts; set it to false
    //this will be set to true when we are within the text view
    @State private var startGame=false
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select Game", selection: $gameType){
                    Text("Select Game Type").tag(GameType.undetermined)
                    Text("Two sharing same device").tag(GameType.single)
                    Text("Play against a robot").tag(GameType.bot)
                    Text("Challenge a friend remotely").tag(GameType.peer)
                }.padding()
                    .background(RoundedRectangle(cornerRadius:10,style:.continuous).stroke(style:StrokeStyle(lineWidth:2)))
                Text(gameType.description)
                    .padding()
                
                VStack {
                    switch gameType {
                    case .single:
                        TextField("Your Name", text:$yourName)
                        TextField("Opponent Name",text:$opponentName)
                        
                    case .bot:
                        TextField("Your Name", text:$yourName)
                        
                    case .peer:
                        EmptyView()
                        
                    case .undetermined:
                        EmptyView()
                    }
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                .focused($focus)
                .frame(width:350)
                
                if gameType != .peer {
                    Button("Start Game") {
                        focus = false
                        startGame.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(
                        gameType == .undetermined || gameType == .bot && yourName.isEmpty || gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                    )
                    Image("LaunchScreen")
                }
            }
            .padding()
            .navigationTitle("Tic Tac Toe")
            .fullScreenCover(isPresented:$startGame) {
                GameView()
            }
        }
    }
}

#Preview {
    StartView()
}

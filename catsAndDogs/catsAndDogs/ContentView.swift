//
//  ContentView.swift
//  catsAndDogs
//
//  Created by Sorescu, Andrew on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: AnimalModel
    
    var body: some View {
        
        VStack {
            Image(uiImage: UIImage(data: model.animal.imageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFit()
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Text("What is it?")
                    .font(.title)
                    .bold()
                    .padding(.leading,10)
                Spacer()
                Button(action: {self.model.getAnimal()}, label: {
                    Text("Next").bold()
                }).padding(.trailing,10)
            }
            
        }
        .onAppear(perform:model.getAnimal)
        .opacity(model.animal.imageData==nil ?0:1)
    }
}

#Preview {
    ContentView(model: AnimalModel())
}

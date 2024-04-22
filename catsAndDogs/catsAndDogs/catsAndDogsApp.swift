//
//  catsAndDogsApp.swift
//  catsAndDogs
//
//  Created by Sorescu, Andrew on 4/8/24.
//

import SwiftUI

@main
struct catsAndDogsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model:AnimalModel())
        }
    }
}

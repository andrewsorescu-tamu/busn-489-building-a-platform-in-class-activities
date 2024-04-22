//
//  FIrebaseDemoV1App.swift
//  FIrebaseDemoV1
//
//  Created by Sorescu, Andrew on 3/25/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct FIrebaseDemoV1App: App {
    
    init(){
        FirebaseApp.configure()
        makeReservation()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func makeReservation() {
    //connect to a database
    let db = Firestore.firestore()
    let reservation = db.collection("bryanReservations")
    //create a database entry (document on firebase) with a given identifier
    reservation.document("customer1")
        .setData(["name":"Jenna","partySize":5])
    
    //create a database entry (document on firebase) with a unique identifier
    reservation.document().setData(["name":"Tom"])
    
    //create a database entry with given data
    let document = reservation.addDocument(data:["name":"Joy","arrivalTime":"7:30 PM"])
}

func updateReservation() {
    let db = Firestore.firestore()
    let reservation = db.collection("bryanReservations")
    reservation.document().setData(["name":"Joy","arrivalTime":"8:30 PM"], merge:true)
    reservation.document().updateData(["arrivalTime":"8:30 PM"])
    //delete an entire entry
    reservation.document("customer1").delete()
}

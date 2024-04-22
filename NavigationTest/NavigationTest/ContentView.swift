//
//  ContentView.swift
//  NavigationTest
//
//  Created by Sorescu, Andrew on 3/18/24.
//

import SwiftUI

var courses:[Courses] =
[.init(name:"Math",color:.red,imageName:"x.squareroot"),
 .init(name:"Science",color:.green,imageName:"testtube.2"),
 .init(name:"History",color:.yellow,imageName:"scroll")]


var meetings:[Meetings] =
[.init(name:"Dinner",color:.red,
       location:"Velvet Taco"), .init(name:"Midnight Snack",color:.green,location:"Burger Mojo")]

struct ContentView: View {
    @State private var path: [Meetings] = []
    var body: some View {
        NavigationStack(path: $path){
            List {
                Section("My Courses"){
                    ForEach(courses, id:\.name){
                        course in
                    NavigationLink(value: course){
                            Label(course.name, systemImage:course.imageName).foregroundColor(course.color)
                        }
                    }
                }
                Section("My Meetings"){
                    Button("Add meeting") {
                        path.append(meetings.first!)
                    }
                }
            }
            .navigationTitle("My Schedule")
            .navigationDestination(for: Courses.self) { course in
                ZStack{
                    course.color.ignoresSafeArea()
                    Label(course.name, systemImage:course.imageName)
                        .font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Meetings.self) { meeting in
                ZStack{
                    meeting.color.ignoresSafeArea()
                    Text(meeting.location)
                        .font(.largeTitle).bold()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Courses:Hashable {
    let name: String
    let color: Color
    let imageName: String
}

struct Meetings:Hashable {
    let name: String
    let color: Color
    let location: String
}

//
//  ContentView.swift
//  FivesScoreboard Watch App
//
//  Created by John Bennington on 20/12/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var event: Event
    
    var body: some View {
        VStack {
            HStack {
                Text("Monday 5s")
                    .font(Font.title2).bold()
                    .frame(maxWidth: .infinity)
            }
            HStack {
                Button(action: {
                    event.goalScored(teamIndex: event.firstTeam.teamIndex)
                }) {Text("GOAL")}
                    .frame(maxWidth: .infinity)
                    .bold()
                    .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Button(action: {
                    event.goalScored(teamIndex: event.secondTeam.teamIndex)
                }) {Text("GOAL")}
                    .frame(maxWidth: .infinity)
                    .bold()
                    .colorMultiply(.yellow)
            }
            HStack {
                Text(event.firstTeam.name)
                    .font(Font.title2)
                    .foregroundColor(Color.blue)
                    .bold()
                    .frame(maxWidth: .infinity)
                Text(event.secondTeam.name)
                    .font(Font.title2)
                    .foregroundColor(Color.yellow)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            HStack {
                Text("\(event.firstTeam.score)")
                    .font(Font.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                Text("\(event.secondTeam.score)")
                    .font(Font.title)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(event: Event(
        title: "Test",
        firstTeam: Team(name: "Near", score: 0, teamIndex: 1),
        secondTeam: Team(name: "Far", score: 0, teamIndex: 2)
    ))
}

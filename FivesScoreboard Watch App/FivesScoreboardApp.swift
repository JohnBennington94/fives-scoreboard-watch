//
//  FivesScoreboardApp.swift
//  FivesScoreboard Watch App
//
//  Created by John Bennington on 20/12/2023.
//

import SwiftUI

@main
struct FivesScoreboard_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(event: Event(
                title: "Run",
                firstTeam: Team(name: "Near", score: 0, teamIndex: 1),
                secondTeam: Team(name: "Far", score: 0, teamIndex: 2))
            )
        }
    }
}

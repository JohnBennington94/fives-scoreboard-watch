import SwiftUI

class Event: ObservableObject, Identifiable, Codable {
    var id = UUID()
    
    var eventId = UUID().uuidString
    @Published var title: String
    @Published var firstTeam: Team
    @Published var secondTeam: Team
    
    init(title: String, firstTeam: Team, secondTeam: Team) {
        self.title = title
        self.firstTeam = firstTeam
        self.secondTeam = secondTeam
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        firstTeam = try values.decode(Team.self, forKey: .firstTeam)
        secondTeam = try values.decode(Team.self, forKey: .secondTeam)
    }
    
    func goalScored(teamIndex: UInt) {
        if(teamIndex == firstTeam.teamIndex){
            if(secondTeam.score == 0){
                firstTeam.score = firstTeam.score + 1
            }
            if(secondTeam.score > 0){
                secondTeam.score = secondTeam.score - 1
            }
        }
        else if(teamIndex == secondTeam.teamIndex) {
            if(firstTeam.score == 0){
                secondTeam.score = secondTeam.score + 1
            }
            if(firstTeam.score > 0){
                firstTeam.score = firstTeam.score - 1
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case firstTeam
        case secondTeam
        case eventId
   }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(firstTeam, forKey: .firstTeam)
        try container.encode(secondTeam, forKey: .secondTeam)
        try container.encode(eventId, forKey: .eventId)
    }
}

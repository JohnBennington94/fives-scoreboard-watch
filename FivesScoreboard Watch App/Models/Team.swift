struct Team: Codable{
    var name: String
    var score: UInt
    var teamIndex: UInt
    
    
    init(name: String, score: UInt, teamIndex: UInt) {
        self.name = name
        self.score = score
        self.teamIndex = teamIndex
    }
}

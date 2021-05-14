//
//  Player.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

class Player {
    let name: String
    let id: UUID
    
    private let token: UUID
    
    var didStopGame: Bool = false
    var isPassingRound: Bool = false
    
    var correctAnswers: Int8 = 0
        
    func checkToken(_ token: UUID) -> Bool {
        token == self.token
    }
    
    init(name: String, id: UUID, token: UUID) {
        self.name = name
        self.id = id
        self.token = token
    }
}

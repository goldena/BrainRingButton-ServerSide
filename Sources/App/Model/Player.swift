//
//  Player.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class Player: CanAccessNetwork {
    
    // Initialized variables
    let name: String
    let id: UUID
    
    private let token: UUID? = nil
    
    // Game mechanics variables
    var didStopGame = false
    var isPassingRound = false
    
    var correctAnswers = 0
        
    // WebSocket login check
    func checkToken(_ token: UUID) -> Bool {
        token == self.token
    }
    
    init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}

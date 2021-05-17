//
//  GameController.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameController {
    
    private var players: [UUID: Player] = [:]
        
    func addPlayer(_ player: Player) {
        players[player.id] = player
    }
    
    func removePlayer(withID: UUID) {
        players[withID] = nil
    }
    
    func startGame() {
        
    }
    
    func newQuestion() {
        
    }
    
    func finishGame() {
        players = [:]
    }    
}

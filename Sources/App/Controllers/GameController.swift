//
//  GameController.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

enum gameStatus: String {
    case gameStarted
    case gamePaused
    case gameOver
}

final class GameController {
    
    private(set) var players: [UUID: Player] = [:]
        
    func addPlayer(_ player: Player) {
        players[player.id] = player
    }
    
    func removePlayer(withID: UUID) {
        players[withID] = nil
    }
    
    func startGame() {
        NetworkAccessController.notifyPlayers(players, about: .started)
    }
    
    func pauseGame() {
        NetworkAccessController.notifyPlayers(players, about: .paused)
    }
        
    func finishGame() {
        NetworkAccessController.notifyPlayers(players, about: .gameOver)
        
        players = [:]
    }    
}

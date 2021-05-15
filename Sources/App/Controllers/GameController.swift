//
//  GameController.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameController {
    
    // MARK: - Property(s)
    private var gameMaster: GameMaster
    private var players: [UUID: Player] = [:]
    
    var room: Int
    
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
    
    init(room: Int, gameMaster: GameMaster) {
        self.room = room
        self.gameMaster = gameMaster
    }
}

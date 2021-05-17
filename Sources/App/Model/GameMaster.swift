//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation
import os.log

final class GameMaster: Person {
    
    var email: String
    var emailIsValidated = false
    
    var premiumUser = false
    
    var maxPlayers: Int8 {
        premiumUser ? 2 : 8
    }
     
    var gameRoomKey: Int!
    
    func createGameRoom() {
        gameRoomKey = gameRoomsController.createRoom(for: self)
    }
    
    func addPlayer(_ player: Player) {
        guard let gameController = gameRoomsController.rooms[gameRoomKey] else { fatalError("Trying to add a player to a non-existing room") }
        
        guard gameController.players.count < maxPlayers else {
            NSLog("Exceeding max players")
            return
        }
        
        #warning("Start here")
        guard gameRoomsController.rooms[gameRoomKey]?.players.count
        
        gameRoomsController.rooms[gameRoomKey]?.addPlayer(player)
    }
    
    init(person: Person, email: String) {
        self.email = email
        
        super.init(name: person.name, id: person.id)
        
        NetworkAccessController.validateEmail(for: self)
    }
}

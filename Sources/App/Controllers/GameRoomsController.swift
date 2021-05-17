//
//  GameRoomsController.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameRoomsController {
    
    var rooms: [Int: GameController] = [:]
    
    // Add game, return a new Game Room number
    func createRoom(for: GameMaster) -> Int {
        var newRoomKey = 0
        
        while true {
            if rooms.contains(where: { $0.key == newRoomKey }) {
                newRoomKey += 1
            } else {
                rooms[newRoomKey] = GameController()
                return newRoomKey
            }
        }
    }
    
    func removeRoom(room: Int) {
        rooms[room] = nil
    }
}

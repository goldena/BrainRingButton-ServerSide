//
//  GameRoomsController.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameRoomsController {
    var activeGameRooms: [Int: GameController] = [:]
    
    // Add game, return a new Game Room number
    func addGameRoom() -> Int {
        var newGameRoomKey = 0
        
        while true {
            if activeGameRooms.contains(where: { $0.key == newGameRoomKey }) {
                newGameRoomKey += 1
            } else {
                return newGameRoomKey
            }
        }
    }
    
    func removeGame(room: Int) {
        activeGameRooms[room] = nil
    }
}

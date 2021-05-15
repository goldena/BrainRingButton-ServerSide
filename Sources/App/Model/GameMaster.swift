//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameMaster: CanAccessNetwork {
    
    let name: String
    let id: UUID
    
    private let token: UUID? = nil
    
    init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}

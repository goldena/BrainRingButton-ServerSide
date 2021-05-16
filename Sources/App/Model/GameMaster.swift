//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class GameMaster: CanAccessNetwork {
    
    var email: String
    var emailIsValidated: Bool = false
    
    let name: String
    let id: UUID
    
    private let token: UUID? = nil
    
    init(name: String, id: UUID, email: String) {
        self.name = name
        self.id = id
        
        self.email = email
        
        NetworkAccessController.validateEmail(for: self)
    }
}

//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class NetworkAccessController {
    
    private static func getToken() -> UUID { UUID() }
    
    static func grantAccess(for person: CanAccessNetwork, to room: Int) -> Result<UUID, Error> {
        return Result.success(getToken())
    }
    
    static func validateEmail(for gameMaster: GameMaster) {
        // #warning("Temporary stub")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            gameMaster[keyPath: \GameMaster.emailIsValidated] = true
        }
    }
}

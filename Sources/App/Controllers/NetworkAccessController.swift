//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class NetworkAccessController {
    
    private static func getToken() -> UUID { UUID() }
    
    static func grantAccess(for person: CanAccessNetwork, to lobby: Int) -> Result<UUID, Error> {
        return Result.success(getToken())
    }
}

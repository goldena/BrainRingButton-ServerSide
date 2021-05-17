//
//  Person.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

class Person {
    private(set) var name: String
    let id: UUID
    
    private let token: UUID? = nil
    
    func setName(name: String) {
        self.name = name
    }
    
    init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}

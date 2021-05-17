//
//  Player.swift
//  
//
//  Created by Denis Goloborodko on 15.05.21.
//

import Foundation

final class Player: Person {
    
    // Game mechanics variables
    var didStopGame = false
    var wrongAnswer = false
    
    var correctAnswers = 0
        
    init(person: Person) {
        super.init(name: person.name, id: person.id)
    }
}

//
//  Game.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 14.05.2022.
//

import UIKit


class Game {
    var result: [Int] = []
    var name = ""
    var gameSession: GameSession?
    
    private init() {
        
    }
    
    static let shared = Game()
    
}

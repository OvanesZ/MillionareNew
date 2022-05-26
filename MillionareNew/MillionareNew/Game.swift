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
    var stateSegmentControl: Difficulty?
    let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] = [] {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    private init() {
        records = recordsCaretaker.retrive()
    }
    
    static let shared = Game()
    
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
}

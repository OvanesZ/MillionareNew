//
//  RecordsCaretaker.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 14.05.2022.
//

import Foundation


class RecordsCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrive() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

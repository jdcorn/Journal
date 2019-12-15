//
//  EntryController.swift
//  journal
//
//  Created by Jon Corn on 12/15/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - Properties
    static var shared = EntryController()
    var entries = [Entry]()
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD
    func addEntry(title: String, bodyText: String) {
        let entry = Entry(title: title, bodyText: bodyText)
        entries.append(entry)
        saveToPersistentStore()
    }
    
    func removeEntry(entry: Entry) {
        if let index = entries.firstIndex(of: entry) {
            entries.remove(at: index)
        }
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        if let index = entries.firstIndex(of: entry) {
            entries[index].title = title
            entries[index].bodyText = bodyText
        }
    }
    
    //  MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "entrySaved.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch let error {
            print(error)
        }
    }
}

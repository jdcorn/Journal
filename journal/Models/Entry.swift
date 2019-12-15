//
//  Entry.swift
//  journal
//
//  Created by Jon Corn on 12/15/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation

class Entry: Codable {
    
    var title: String
    var bodyText: String
    var timestamp: Date
    
    init(title: String, bodyText: String, timestamp: Date = Date()) {
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        rhs.title == lhs.title && rhs.bodyText == lhs.bodyText && rhs.timestamp == lhs.timestamp
    }
}

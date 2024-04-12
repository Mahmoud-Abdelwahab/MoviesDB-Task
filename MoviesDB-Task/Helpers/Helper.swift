//
//  Helper.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

struct Helper {
    
   static func getYear(from dateString: String) -> String? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withYear]
        if let date = formatter.date(from: dateString) {
            return String(Calendar.current.component(.year, from: date))
        }
        return nil
    }
}

//
//  Helper.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

struct Helper {
    
   static func getYear(from dateString: String) -> String? {
       let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd"
          
          if let date = dateFormatter.date(from: dateString) {
              let calendar = Calendar.current
              let year = calendar.component(.year, from: date)
              return "\(year)"
          } else {
              return nil
          }
    }
}

//
//  Date++.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import Foundation

extension String {
    
    // Date From String
    func convertDateFormater() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        guard let date = dateFormatter.date(from: self) else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
    }
    
}

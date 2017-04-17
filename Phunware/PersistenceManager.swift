//
//  PersistenceManager.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import Foundation

// Paths For Data Persistance
enum Path: String {
    case Events
}

class PersistenceManager {
    
    // Directory Manager
    class private func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] as String
        return documentDirectory as NSString
    }
    
    // Save Objects To Disk
    class func saveNSArray(arrayToSave: NSArray, path: Path) {
        let file = documentsDirectory().appendingPathComponent(path.rawValue)
        NSKeyedArchiver.archiveRootObject(arrayToSave, toFile: file)
    }
    
    // Load Data From Disk
    class func loadNSArray(path: Path) -> NSArray? {
        let file = documentsDirectory().appendingPathComponent(path.rawValue)
        let result = NSKeyedUnarchiver.unarchiveObject(withFile: file)
        return result as? NSArray
    }
    
}

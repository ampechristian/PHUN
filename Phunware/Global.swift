//
//  Global.swift
//  Phunware
//
//  Created by Ampe on 4/15/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

// MARK: - Global Var Declarations
class Global {
    
    static let sharedInstance = Global()
    
    let device = UIDevice.current.model
    
    var cols: CGFloat {
        if device == "iPad" { return 2 }
        else { return 1 }
    }
    
}

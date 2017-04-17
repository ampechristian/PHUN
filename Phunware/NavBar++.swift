//
//  NavBar++.swift
//  Neighboring_Pros
//
//  Created by Ampe on 4/7/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    // Hides The Navbar Background & Image
    func hide() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
}

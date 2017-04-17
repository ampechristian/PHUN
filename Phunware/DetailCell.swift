//
//  DetailCell.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var locOne: UILabel!
    @IBOutlet weak var locTwo: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var descript: UILabel!

    var event: EventModel? {
        didSet { updateUI() }
    }
    
    // Set Cell Data (& Provide Data Defaults)
    private func updateUI() {
        let locOne = event?.locationLineOne ?? "(location info not provided)"
        self.locOne.text = locOne
        let locTwo = event?.locationLineTwo ?? "(system info not provided)"
        self.locTwo.text = locTwo
        let phoneNumber = event?.phone ?? "(contact info not provided)"
        self.phoneNumber.text = phoneNumber
        let description = event?.descript ?? "(description not provided)"
        self.descript.text = description
    }
    
}

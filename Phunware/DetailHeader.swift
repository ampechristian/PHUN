//
//  DetailHeader.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit
import Kingfisher

class DetailHeader: UIView {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    
    var event: EventModel? {
        didSet { updateUI() }
    }
    
    // Set Cell Data
    private func updateUI() {
        if let image = event?.image {
            self.image.kf.setImage(with: image, completionHandler: { (img, err, cache, url) in
                if (err != nil) { self.image.image = UIImage(named: "placeholder.jpg") }
            })
        } else { self.image.image = UIImage(named: "placeholder.jpg") }
        if let date = event?.date {
            self.date.text = date.convertDateFormater()
        }
        if let title = event?.title {
            self.title.text = title
        }
    }
    
}

//
//  EventsCell.swift
//  Phunware
//
//  Created by Ampe on 4/11/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit
import Kingfisher

class EventsCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var descript: UILabel!
    
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
        guard let locOne = event?.locationLineOne else { return }
        guard let locTwo = event?.locationLineTwo else { return }
        self.location.text = "\(locOne) \(locTwo)"
        if let description = event?.descript {
            self.descript.text = description
        }
    }
    
}

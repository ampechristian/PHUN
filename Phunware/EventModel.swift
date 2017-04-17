//
//  EventModel.swift
//  Phunware
//
//  Created by Ampe on 4/10/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import SwiftyJSON

// MARK: - Event Structure
class EventModel: NSObject, NSCoding {
    
    var id: Int?
    var descript: String?
    var title: String?
    var timeStamp: String?
    var image: URL?
    var phone: String?
    var date: String?
    var locationLineOne: String?
    var locationLineTwo: String?
    
    // MARK: - Required Initializers
    required init(id: Int?, descript: String?, title: String?, timeStamp: String?, image: URL?, phone: String?, date: String?, locationLineOne: String?, locationLineTwo: String?) {
        if let id = id {
            self.id = id
        }
        if let descript = descript {
            self.descript = descript
        }
        if let title = title {
            self.title = title
        }
        if let timeStamp = timeStamp {
            self.timeStamp = timeStamp
        }
        if let image = image {
            self.image = image
        }
        if let phone = phone {
            self.phone = phone
        }
        if let date = date {
            self.date = date
        }
        if let locationLineOne = locationLineOne {
            self.locationLineOne = locationLineOne
        }
        if let locationLineTwo = locationLineTwo {
            self.locationLineTwo = locationLineTwo
        }
    }
    
    // MARK: - Map JSON To Object
    required convenience init?(jsonData: JSON) {
        let id = jsonData["id"].int ?? nil
        let descript = jsonData["description"].string ?? nil
        let title = jsonData["title"].string ?? nil
        let timeStamp = jsonData["timestamp"].string ?? nil
        let image = jsonData["image"].url ?? nil
        let phone = jsonData["phone"].string ?? nil
        let date = jsonData["date"].string ?? nil
        let locationLineOne = jsonData["locationline1"].string ?? nil
        let locationLineTwo = jsonData["locationline2"].string ?? nil
        self.init(id: id, descript: descript, title: title, timeStamp: timeStamp, image: image, phone: phone, date: date, locationLineOne: locationLineOne, locationLineTwo: locationLineTwo)
    }
    
    // MARK: - Save Data To Disk
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(descript, forKey: "description")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(timeStamp, forKey: "timeStamp")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(phone, forKey: "phone")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(locationLineOne, forKey: "locationLineOne")
        aCoder.encode(locationLineTwo, forKey: "locationLineTwo")
    }
    
    // MARK: - Decode Disk Data & Init
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? Int
        let descript = aDecoder.decodeObject(forKey: "description") as? String
        let title = aDecoder.decodeObject(forKey: "title") as? String
        let timeStamp = aDecoder.decodeObject(forKey: "timeStamp") as? String
        let image = aDecoder.decodeObject(forKey: "image") as? URL
        let phone = aDecoder.decodeObject(forKey: "phone") as? String
        let date = aDecoder.decodeObject(forKey: "date") as? String
        let locationLineOne = aDecoder.decodeObject(forKey: "locationLineOne") as? String
        let locationLineTwo = aDecoder.decodeObject(forKey: "locationLineTwo") as? String
        self.init(id: id, descript: descript, title: title, timeStamp: timeStamp, image: image, phone: phone, date: date, locationLineOne: locationLineOne, locationLineTwo: locationLineTwo)
    }
    
}

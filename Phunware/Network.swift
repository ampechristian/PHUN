//
//  Network.swift
//  JSONMapping
//
//  Created by Ampe on 3/29/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

// MARK: - Networking Singleton
struct Network {
    
    // Singleton Definition
    static let sharedInstance = Network()
    
    // Instance of Request Provider
    let provider = MoyaProvider<Request>()
    
    // Fetch Function
    func fetch(completion: @escaping ([EventModel]) -> ()) {
        provider.request(.fetchData()) { (result) in
            switch result {
            case let .success(response):
                var eventArray = [EventModel]()
                if let jsonArray = JSON(data: response.data).array {
                    for json in jsonArray {
                        eventArray.append(EventModel(jsonData: json)!)
                    }
                }
                completion(eventArray)
            case .failure(_): break
            }
        }
    }
    
}



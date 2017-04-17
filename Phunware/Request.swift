//
//  Request.swift
//  JSONMapping
//
//  Created by Ampe on 3/29/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import Foundation
import Moya

// MARK: - Possible Requests
enum Request {
    case fetchData()
}

// MARK: - Request Construction
extension Request: TargetType {
    
    // Define Base URL
    var baseURL: URL { return URL(string: "https://raw.githubusercontent.com")! }
    
    // Define Path Extenders
    var path: String {
        switch self {
        case .fetchData:
            return "phunware/dev-interview-homework/master/feed.json"
        }
    }
    
    // HTTP Methods
    var method: Moya.Method {
        switch self {
        case .fetchData:
            return .get
        }
    }
    
    // HTTP Paramaters
    var parameters: [String: Any]? {
        switch self {
        case .fetchData:
            return [:]
        }
    }
    
    // Paramater Encoding
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .fetchData:
            return URLEncoding.default
        }
    }
    
    // URL Build (N/A Due To Single Endpoint)
    var sampleData: Data {
        switch self {
        case .fetchData:
            return "{}".utf8Encoded
        }
    }
    
    // Request / Download / Upload
    var task: Task {
        switch self {
        case .fetchData:
            return .request
        }
    }
}

// MARK: - Helpers
private extension String {
    
    // N/A Due To Trivial Request
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    // N/A Due To Trivial Request
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}

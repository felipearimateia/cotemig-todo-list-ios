//
//  Connectivity.swift
//  TodoList
//
//  Created by COTEMIG on 24/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

//
//  LoginResponse.swift
//  TodoList
//
//  Created by Felipe Arimateia on 01/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let id: String
    let name: String
    let email: String
    let token: String
    let active: Bool
}

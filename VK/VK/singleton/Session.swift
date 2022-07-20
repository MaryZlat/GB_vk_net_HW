//
//  Session.swift
//  VK
//
//  Created by Mary Zlatnikova on 12.07.2022.
//

import Foundation

class Session {
    private init() {}
    static let shared = Session()
    
    var userToken: String = ""
    var userID: Int = 0
}

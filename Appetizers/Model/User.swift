//
//  User.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 26/04/2026.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}

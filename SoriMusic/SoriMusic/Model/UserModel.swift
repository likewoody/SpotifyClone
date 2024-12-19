//
//  UserModel.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

struct UserModel: Codable {
    let name: String
    let email: String
    let followers: Int
    let following: Int
}

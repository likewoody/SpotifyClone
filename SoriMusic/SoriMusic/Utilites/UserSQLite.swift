//
//  UserSQLite.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import Foundation
import SQLite3

extension FileManager {
    static func getUrlPath(fileName: String) -> URL? {
        (FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appending(path: "\(fileName).sqlite")) ?? nil
    }
}

struct UserSQLite {
    var db: OpaquePointer?
    var user: UserModel? = nil
    
    init() {
        guard let url = FileManager.getUrlPath(fileName: "user") else { return }
        
//        if sqlite3_open
    }
    
}

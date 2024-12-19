//
//  HomeViewModel.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

enum CategoriesTopArea: String, CaseIterable {
    case all, music, podcasts, wrapped
}

@Observable class HomeViewModel {
    
    var user: UserModel? = nil
    @ObservationIgnored let categoriesTopArea: [String] = CategoriesTopArea.allCases.map(\.rawValue)
    @ObservationIgnored private let sqlite = UserSQLite()
    
    init() {
        getUserInfo()
//        setCategoriesTopArea()
    }
    
    private func getUserInfo() {
        user = UserModel(name: "Woody Jo", email: "jsjsjs@gmail.com", followers: 0, following: 0)
    }
    
//    private func setCategoriesTopArea() {
//        categoriesTopArea = CategoriesTopArea.allCases.map { category in
//            switch category {
//            default:
//                category.rawValue
//            }
//        }
//    }
    
    func saveUser() {
        
    }
}

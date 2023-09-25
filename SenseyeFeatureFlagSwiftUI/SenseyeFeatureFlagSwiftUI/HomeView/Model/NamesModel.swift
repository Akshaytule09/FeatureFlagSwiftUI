//
//  NamesModel.swift
//  SenseyeFeatureFlag
//
//  Created by Akshay Tule on 24/09/23.
//

import Foundation

// shall be codable incase of API calls are implemented to get the names data
struct Name {
    var name: String
    var nickName: String
    var shouldCapitalizeNickname: Bool = false
}

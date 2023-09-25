//
//  HomeControllerViewModel.swift
//  SenseyeFeatureFlag
//
//  Created by Akshay Tule on 24/09/23.
//

import Foundation

//MARK: HomeControllerViewModel primary functionality
class HomeControllerViewModel: ObservableObject {
    
    // observed properties
    @Published var username = String.k.emptyString
    @Published var nickName: String = String.k.emptyString
    
    init() {}
    
    /// On enter button tap pass the entered user name to feature flag for mapping and get the nick name. once nick name is available use the capitalizeNickname flag for checking if this nick name shall be returned as capital letter format of as it is.
    /// - Parameter userName: username entered by user in username textfield
    /// - Returns: Nick Name (capitalized or as it is as per capitalizeNickname featiure flag)
    func getNickName() {
        guard !username.isEmpty else { return }
        let feature = Feature(userName: username.lowercased())
        // accessing nickname and capitalizeNickname via private(set) property in Feature class.
        let nickName = feature.capitalizeNickname ? feature.nickName.uppercased() : feature.nickName
        self.nickName = String.k.nickNamePrefix + nickName
    }
}

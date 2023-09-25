//
//  ContentView.swift
//  SenseyeFeatureFlagSwiftUI
//
//  Created by Akshay Tule on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    // view model
    @ObservedObject private var viewModel = HomeControllerViewModel()
    
    var body: some View {
        VStack {
            TextFieldView(userName: $viewModel.username, nickName: $viewModel.nickName)
            ButtonView(viewModel: viewModel)
            CustomizedNicknameLabel(nickname: viewModel.nickName)
        }
        .padding()
    }
}

struct TextFieldView: View {
    @Binding var userName: String
    @Binding var nickName: String
    var body: some View {
        TextField(String.k.usernamePlaceHolder, text: $userName)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .onChange(of: userName) { newValue in
            nickName = String.k.emptyString
        }
    }
}

struct ButtonView: View {
    
    @ObservedObject var viewModel: HomeControllerViewModel
    
    var body: some View {
        Button(action: {
            viewModel.getNickName()
        }) {
            Text(String.k.enterButtonText)
                .padding([.leading, .trailing], Constants.buttonHotizontalPadding)
                .padding([.top, .bottom], Constants.buttonVerticalPadding)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}

struct CustomizedNicknameLabel: View {
    var nickname: String
    
    var body: some View {
        Text(nickname)
            .font(.headline)
            .padding()
    }
}

extension ButtonView {
    enum Constants {
        static let buttonHotizontalPadding: CGFloat = 30.0
        static let buttonVerticalPadding: CGFloat = 10.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

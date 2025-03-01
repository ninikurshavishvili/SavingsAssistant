//
//  LoginPage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct LoginPage: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            CustomColors.homePageDark
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("გამარჯობა")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                TextField("მომხმარებლის სახელი", text: $viewModel.email)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                SecureField("პაროლი", text: $viewModel.password)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                HStack {
                    Button(action: {
                        viewModel.rememberMe.toggle()
                    }) {
                        Image(systemName: viewModel.rememberMe ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(viewModel.rememberMe ? .blue : .gray)
                    }
                    
                    Text("დათანხმება")
                        .foregroundColor(.white)
                        .onTapGesture {
                            viewModel.rememberMe.toggle()
                        }

                    Spacer()
                }
                .padding(.horizontal)
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("შესვლა")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isLoginEnabled ? Color.blue : Color.gray)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .disabled(!viewModel.isLoginEnabled)
                
                Spacer()
                Text("სახელის და პაროლის აღდგენა")
                    .foregroundColor(.blue)
                    .padding(.top)
                
                Text("არ ხართ რეგისტრირებული?")
                    .foregroundColor(.gray)
                
                Text("რეგისტრაცია")
                    .foregroundColor(.blue)
                    .bold()
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.navigateToContent) {
            ContentView()
        }
    }
}



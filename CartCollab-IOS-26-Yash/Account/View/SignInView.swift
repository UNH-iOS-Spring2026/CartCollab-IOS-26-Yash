//
//  SignInView.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/4/26.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = "Test@test.com"
    @State private var password: String = "test123"
    @State private var signedIn = false
    
    var body: some View {
        let title = Text("CartCollab")
            .font(.system(size: 50, weight: .medium))
            .foregroundColor(.black)
        let image = Image("groceries")
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 250, height: 250, alignment: .center)
        
        let emailField = TextField("Email", text: $username)
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 30, design: .default))
        
        let passField = SecureField("Password", text: $password)
            .autocorrectionDisabled()
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 30, design: .default))
        
        let signInButton = Text("Sign In")
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: 200)
            .background(Color.BADDAD)
            .cornerRadius(40)
            .shadow(radius: 6)
        
        let forgotPassButton = Text("Forgot Password?")
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(Color(.BADDAD))
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        
        let signUpButton = Text("Don't have an account? Sign Up")
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(Color(.BADDAD))
        
        NavigationStack {
            VStack {
                title
                image
                Spacer()
                emailField
                passField
                signInButton
                NavigationLink{
                    ForgotPasswordView()
                }label: {
                    forgotPassButton
                }
                Spacer()
                NavigationLink{
                    SignUpView()
                }label: {
                    signUpButton
                }
            }
        }
    }
}

#Preview {
    SignInView()
}

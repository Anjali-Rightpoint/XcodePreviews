//
//  LoginView.swift
//  PreviewDemo
//
//  Created by Anjali Aggarwal on 13/07/20.
//  Copyright © 2020 Anjali Aggarwal. All rights reserved.
//

import UIKit
import SwiftUI


@objc protocol SignInActions {
    func signInTapped(_ sender: UIButton)
}

final class LoginView: UIView {
    
    var userNamePlaceholder = String() {
        didSet{
            userNameTextField.placeholder = userNamePlaceholder
        }
    }
    var passwordPlaceholder = String() {
        didSet{
            passwordTextField.placeholder = passwordPlaceholder
        }
    }
    
    var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .go
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(nil, action:  #selector(SignInActions.signInTapped(_:)), for: .touchUpInside)
        button.setTitle("LogIn", for: .normal)
        button.backgroundColor = UIColor.lightGray
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        let logInStackView = UIStackView(arrangedSubviews: [userNameTextField, passwordTextField,loginButton, UIView()])
        logInStackView.axis = .vertical
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.spacing = 20
        logInStackView.setCustomSpacing(40, after: passwordTextField)
        addSubview(logInStackView)
        
        NSLayoutConstraint.activate([
            logInStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logInStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logInStackView.topAnchor.constraint(equalTo: topAnchor),
            logInStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let loginView = LoginView()
            loginView.userNamePlaceholder = "TestUser"
            loginView.passwordPlaceholder = "*****"
            return loginView
        }
    }
}





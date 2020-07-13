//
//  ViewController.swift
//  XCodePreviews
//
//  Created by Anjali Aggarwal on 13/07/20.
//  Copyright © 2020 Anjali Aggarwal. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var loggedInUserName = String() {
        didSet {
            loggedInUserLabel.text = loggedInUserName
        }
    }
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "SignIn"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var loggedInUserLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loginView.userNamePlaceholder = "Enter username"
        loginView.passwordPlaceholder = "Enter password"
       
        let stack = UIStackView(arrangedSubviews: [UIView(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 80)),
                                                   headerLabel,
                                                   loginView,
                                                   loggedInUserLabel, UIView()])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 40
        stack.backgroundColor = UIColor.red
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
}

extension ViewController: SignInActions {
    func signInTapped(_ sender: UIButton) {
        loggedInUserLabel.text = "Hi \(loginView.userNameTextField.text ?? "")"
    }
}

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let loginController = ViewController()
            loginController.loggedInUserName = "Hi TestUser"
            return loginController
        }
    }
}

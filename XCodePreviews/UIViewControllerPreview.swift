//
//  UIViewControllerPreview.swift
//  PreviewDemo
//
//  Created by Anjali Aggarwal on 13/07/20.
//  Copyright © 2020 Anjali Aggarwal. All rights reserved.
//

import Foundation


import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}

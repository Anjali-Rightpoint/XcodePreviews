//
//  UIViewPreview.swift
//  PreviewDemo
//
//  Created by Anjali Aggarwal on 13/07/20.
//  Copyright © 2020 Anjali Aggarwal. All rights reserved.
//

import Foundation
import SwiftUI


struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

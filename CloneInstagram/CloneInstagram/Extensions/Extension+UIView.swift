//
//  Extension+UIView.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

extension UIView {
    func makeCircular() {
        // Ensure that the view is square
        let sideLength = min(frame.size.width, frame.size.height)
        
        // Make the view circular
        layer.cornerRadius = sideLength / 2
        clipsToBounds = true
    }
}

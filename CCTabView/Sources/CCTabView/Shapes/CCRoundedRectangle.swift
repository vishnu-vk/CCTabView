//
//  CCRoundedRectangle.swift
//  
//
//  Created by Vishnu on 06/01/24.
//

import Foundation
import SwiftUI

struct CCRoundedRectangle: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//
//  UIView.swift
//  CarouselView
//
//  Created by 김지민 on 2022/07/08.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

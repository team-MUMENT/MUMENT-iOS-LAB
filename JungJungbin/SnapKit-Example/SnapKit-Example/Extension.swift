//
//  Extension.swift
//  SnapKit-Example
//
//  Created by madilyn on 2022/07/05.
//

import Foundation
import UIKit

extension UIButton {
    /**
     button에 대해 addTarget해서 일일이 처리안하고, closure 형태로 동작을 처리하기 위해 다음과 같은 extension을 활용합니다
     press를 작성하고, 안에 버튼이 눌렸을 때, 동작하는 함수를 만듭니다.
     
     clicked(completion : @escaping ((Bool) -> Void)) 함수를 활용해,
     버튼이 눌렸을때, 줄어들었다가 다시 늘어나는 (Popping)효과를 추가해서
     사용자에게 버튼이 눌렸다는 인터렉션을 제공합니다!
     
     진동은 선택 가능하게 바꾸었습니다.
     
     iOS14부터는 UIAction의 addAction이 가능
     iOS13까지는 NSObject형태로 등록해서 처리하는 방식으로 분기처리합니다.
     */
    func press(vibrate: Bool = false, for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        if #available(iOS 14.0, *) {
            self.addAction(UIAction { (action: UIAction) in closure()
                //                self.clickedAnimation(vibrate: vibrate)
            }, for: controlEvents)
        } else {
            @objc class ClosureSleeve: NSObject {
                let closure:()->()
                init(_ closure: @escaping()->()) { self.closure = closure }
                @objc func invoke() { closure() }
            }
            let sleeve = ClosureSleeve(closure)
            self.addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
            objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

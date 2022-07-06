//
//  ScrollViewVC.swift
//  SnapKit-Example
//
//  Created by madilyn on 2022/07/06.
//

import Foundation
import UIKit

class ScrollViewVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    private let leftview = UIView().then {
        $0.backgroundColor = .red
    }
    private let centerView = UIView().then {
        $0.backgroundColor = .orange
    }
    private let rightView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
//    private let stackView = UIStackView().then {
//        $0.axis = .horizontal
//        $0.distribution = .fill
//        $0.alignment = .fill
//    }
//
//    private let removeOrangeButton = UIButton().then {
//        $0.setTitle("remove orange", for: .normal)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        
        view.addSubviews([scrollView])
        scrollView.addSubviews([contentView])
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        contentView.addSubviews([leftview, centerView, rightView])
        
        
        
        //        stackView.addArrangedSubviews([leftview, centerView, rightView])
        //        view.addSubviews([stackView, removeOrangeButton])
        
        leftview.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        centerView.snp.makeConstraints {
            $0.top.equalTo(leftview.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        rightView.snp.makeConstraints {
            $0.top.equalTo(centerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview() // 이것이 중요함
        }
        
//        stackView.snp.makeConstraints {
//            $0.left.top.right.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(500)
//        }
    }
}

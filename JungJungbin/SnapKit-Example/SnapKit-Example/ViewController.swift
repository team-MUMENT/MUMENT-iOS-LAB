//
//  ViewController.swift
//  SnapKit-Example
//
//  Created by madilyn on 2022/07/05.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    private let leftview = UIView().then {
        $0.backgroundColor = .red
    }
    private let centerView = UIView().then {
        $0.backgroundColor = .orange
    }
    private let rightView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let removeOrangeButton = UIButton().then {
        $0.setTitle("remove orange", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        stackView.addArrangedSubviews([leftview, centerView, rightView])
        view.addSubviews([stackView, removeOrangeButton])
        
        leftview.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        centerView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        rightView.snp.makeConstraints {
            $0.width.equalTo(100).priority(999)
        }
        
        stackView.snp.makeConstraints {
            $0.left.top.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(500)
        }
    }
}


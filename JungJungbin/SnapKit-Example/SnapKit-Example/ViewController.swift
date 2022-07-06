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
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
    }
    
    private let removeOrangeButton = UIButton().then {
        $0.setTitle("remove orange", for: .normal)
        $0.setTitleColor(.orange, for: .normal)
    }
    
    private let goScrollViewButton = UIButton().then {
        $0.setTitle("go scroll view", for: .normal)
        $0.setTitleColor(.systemPink, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setRemoveOrangeButton()
        setGoScrollViewButton()
    }
    
    private func setUI() {
        stackView.addArrangedSubviews([leftview, centerView, rightView])
        buttonStackView.addArrangedSubviews([removeOrangeButton, goScrollViewButton])
        view.addSubviews([stackView, buttonStackView])
        
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
        
        buttonStackView.snp.makeConstraints {
            $0.centerX.equalTo(stackView.snp.centerX)
            $0.width.height.equalTo(150)
            $0.top.equalTo(stackView.snp.bottom).offset(20)
        }
    }
    
    private func setRemoveOrangeButton() {
        removeOrangeButton.press {
            self.centerView.removeFromSuperview()
        }
    }
    
    private func setGoScrollViewButton() {
        goScrollViewButton.press {
            self.present(ScrollViewVC(), animated: true)
        }
    }
}

//
//  ViewController.swift
//  SnapKit-Live
//
//  Created by madilyn on 2022/07/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private let redView = UIView().then { view in
        view.backgroundColor = .red
    }
    
    private let button = UIButton().then {
        $0.setTitle("안녕", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .yellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButton()
        self.navigationController?.title = "asdfjlaksd"
    }
    
    private func setLayout() {
        view.addSubview(redView)
        view.addSubview(button)

        button.snp.makeConstraints {
            $0.top.right.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.equalTo(50)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom).offset(20)
            
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }

    }
    
    private func setUI() {
        
    }
    
    private func setButton() {
        button.press {
            print("dasldkjfalskdjfalksdfj")
            
            self.redView.snp.updateConstraints {
                $0.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(100)
            }
        }
    }
}

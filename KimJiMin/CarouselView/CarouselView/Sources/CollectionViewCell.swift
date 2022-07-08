//
//  CollectionViewCell.swift
//  CarouselView
//
//  Created by 김지민 on 2022/07/08.
//

import UIKit
import SnapKit
import Then

class MyCell: UICollectionViewCell {

    var model: UIColor? { didSet { bind() } }

//    lazy var titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

//    private func setLayout() {
//        self.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
//        backgroundColor = .placeholderText
//    }

    private func bind() {
        self.backgroundColor = model
    }

}

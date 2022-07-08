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

    static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }

    var model: String? { didSet { bind() } }

    lazy var titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func configure() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        backgroundColor = .placeholderText
    }

    private func bind() {
        titleLabel.text = model
    }

}

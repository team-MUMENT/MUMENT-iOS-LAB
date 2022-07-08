//
//  ViewController.swift
//  CarouselView
//
//  Created by 김지민 on 2022/07/08.
//

import UIKit
import SnapKit
import Then

/*Carousel View:
    CollectionView를 Horizontal 방향으로 돌려 쓰는 것
*/
class ViewController: UIViewController {

    var dataSource: [String] = []
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 50 // cell사이의 간격 설정
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .brown

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()

        addSubviews()

        setupDelegate()

        registerCell()

        configure()
    }

    private func setupDataSource() {
        for i in 0...10 {
            dataSource += ["\(i)"]
        }
    }

    private func addSubviews() {
        view.addSubview(collectionView)
    }

    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func registerCell() {
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.reuseIdentifier)
    }

    private func configure() {
        collectionView.snp.makeConstraints { make in
            make.center.leading.trailing.equalToSuperview()
            make.height.equalTo(320)
        }
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MyCell {
            cell.model = dataSource[indexPath.item]
        }

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: collectionView.frame.height) // point
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview(.iPhone13mini)
    }
}
#endif

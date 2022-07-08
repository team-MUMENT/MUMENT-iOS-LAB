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

    var dataSource: [UIColor] = [.purple,.systemIndigo,.systemGreen]
    
    private lazy var carouselCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    private func carouselCollectionViewAttribute() {
            carouselCollectionView.delegate = self
            carouselCollectionView.dataSource = self
            carouselCollectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.reuseIdentifier)
            carouselCollectionView.backgroundColor = .systemPurple
        
        // 그냥 슬라이딩이 아니라 페이지별로 나뉘어 넘어가지도록
            carouselCollectionView.isPagingEnabled = true
        
        // 수평 스크롤
            collectionViewFlowLayout.scrollDirection = .horizontal
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionViewAttribute()
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints{
            $0.center.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(500)
        }
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let endOffset = scrollView.contentSize.width - carouselCollectionView.frame.width
        
        if scrollView.contentOffset.x < .zero && velocity.x < .zero {
            print("처음 -> 마지막")
        } else if scrollView.contentOffset.x > endOffset && velocity.x > .zero  {
            print("마지막 -> 처음")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MyCell {
            cell.model = dataSource[indexPath.item]
        }

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.height)
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

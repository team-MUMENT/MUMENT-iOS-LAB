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
    
    var dataSource:[CVCModel] = CVCModel.sampleData
    
    private lazy var carouselCV = UICollectionView(frame: .zero, collectionViewLayout: CVFlowLayout)
    private let CVFlowLayout = UICollectionViewFlowLayout()
    private var originalDataSourceCount: Int {
        dataSource.count
    }
    
    private lazy var increasedDataSource: [CVCModel] = {
        dataSource + dataSource + dataSource
    }()
    
    private var scrollToEnd: Bool = false
    private var scrollToBegin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionViewAttribute()
        setLayout()
    }

    private func carouselCollectionViewAttribute() {
//        for i in 0..<CVCModel.sampleData.count {
//            CVCModel.sampleData[i].pageNum = i+1
//            print( CVCModel.sampleData[i].pageNum)
//        }
//        carouselCV.reloadData()
        
        carouselCV.delegate = self
        carouselCV.dataSource = self
        carouselCV.register(CVC.self, forCellWithReuseIdentifier: CVC.reuseIdentifier)
        carouselCV.backgroundColor = .systemPurple
        carouselCV.showsHorizontalScrollIndicator = false
        
        // 그냥 슬라이딩이 아니라 페이지별로 나뉘어 넘어가지도록
        carouselCV.isPagingEnabled = true
        
        // 수평 스크롤
        CVFlowLayout.scrollDirection = .horizontal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        carouselCV.scrollToItem(at: IndexPath(item: increasedDataSource.count / 3,section: 0),
                                at: .centeredHorizontally,
                                animated: false)
    }
    
    private func setLayout() {
        view.addSubview(carouselCV)
        carouselCV.snp.makeConstraints{
            $0.center.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(400)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let beginOffset = carouselCV.frame.width * CGFloat(originalDataSourceCount)
        let endOffset = carouselCV.frame.width * CGFloat(originalDataSourceCount * 2 - 1)
        
        if scrollView.contentOffset.x < beginOffset && velocity.x < .zero {
            scrollToEnd = true
        } else if scrollView.contentOffset.x > endOffset && velocity.x > .zero {
            scrollToBegin = true
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollToBegin {
            carouselCV.scrollToItem(at: IndexPath(item: originalDataSourceCount, section: .zero),
                                    at: .centeredHorizontally,
                                    animated: false)
            scrollToBegin.toggle()
            return
        }
        if scrollToEnd {
            carouselCV.scrollToItem(at: IndexPath(item: originalDataSourceCount * 2 - 1, section: .zero),
                                    at: .centeredHorizontally,
                                    animated: false)
            scrollToEnd.toggle()
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return increasedDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVC.reuseIdentifier, for: indexPath)
        if let cell = cell as? CVC {
            cell.setData(increasedDataSource[indexPath.row],index:indexPath.row%3+1)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
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

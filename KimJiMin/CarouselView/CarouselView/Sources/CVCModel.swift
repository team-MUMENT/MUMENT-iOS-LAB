//
//  CVCmodel.swift
//  CarouselView
//
//  Created by 김지민 on 2022/07/08.
//

import UIKit

struct CVCModel {
    var color: UIColor
    let headerTitle: String
    let albumImageTitle: String
    var albumImage: UIImage? {
        return UIImage(named:albumImageTitle)
    }
    let songTitle: String
    let artistName:String
    let pageNum: Int
    var buttonLabel: String {
        return "    \(pageNum) / 3 >  "
    }
}

// MARK: - Extensions
extension CVCModel {
    static var sampleData: [CVCModel] = [
        CVCModel(color: .purple, headerTitle:"신남 태그가 많이 남겨진 곡",albumImageTitle:"image1",songTitle: "San Francisco",artistName:"ADOY",pageNum:0),
        CVCModel(color: .systemIndigo, headerTitle:"저녁 태그가 많이 남겨진 곡",albumImageTitle:"image2",songTitle: "MacBook Air", artistName:"Apple",pageNum:0),
        CVCModel(color: .systemGreen, headerTitle:"비 태그가 많이 남겨진 곡",albumImageTitle:"image3",songTitle:"MacBook Pro",artistName:"orange",pageNum:0)
    ]
}

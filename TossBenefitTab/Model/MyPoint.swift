//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by 조상우 on 2022/11/30.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}

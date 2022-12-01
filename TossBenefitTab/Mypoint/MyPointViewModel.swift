//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by 조상우 on 2022/12/01.
//

import Foundation

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
    
}

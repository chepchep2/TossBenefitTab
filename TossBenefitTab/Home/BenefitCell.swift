//
//  BenefitCell.swift
//  TossBenefitTab
//
//  Created by 조상우 on 2022/11/30.
//

import UIKit

class BenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var benefitImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: Benefit) {
        benefitImage.image = UIImage(named: item.imageName)
        descriptionLabel.text = item.description
        titleLabel.text = item.title
    }
}
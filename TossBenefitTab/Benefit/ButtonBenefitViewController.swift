//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by 조상우 on 2022/11/30.
//

import UIKit
import Combine

class ButtonBenefitViewController: UIViewController {

    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    var viewModel: ButtonBenefitViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        viewModel.fetchDetails()

    }
    
    private func setupUI() {
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bind() {
        
        viewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
            }.store(in: &subscriptions)
        
        viewModel.$benefitDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.addGuide(details: details)
            }.store(in: &subscriptions)
        
    }
    
    private func addGuide(details: BenefitDetails) {
        let guideView = vStackView.arrangedSubviews.filter { $0 is BenefitGuideView }
        guard guideView.isEmpty else { return }
        
        let guideViews: [BenefitGuideView] = details.guides.map { guide in
            let guideView = BenefitGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        guideViews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        
    }
}

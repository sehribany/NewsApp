//
//  MainNavigationController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import UIKit

class MainNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }

    private func configureContents() {
        let backImage = Asset.Icons.icBack.image
            .resize(to: .init(width: 11, height: 18))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0))
        
        let titleTextAttributes : [NSAttributedString.Key:Any] = [
            .font: UIFont.font(.nunitoExtraBold,size: .medium),
            .foregroundColor: Asset.Colors.appBlack.color
        ]
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.font(.nunitoSemiBold, size: .large),
            .foregroundColor: Asset.Colors.appBlack.color
        ]
            
        navigationBar.barTintColor        = Asset.Colors.appRaven.color
        navigationBar.shadowImage         = UIImage()
        navigationBar.tintColor           = Asset.Colors.appBlack.color
        navigationBar.titleTextAttributes = titleTextAttributes
        UIBarButtonItem.appearance().setTitleTextAttributes(textAttributes,for: .normal)

        navigationBar.backIndicatorImage               = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        if #available(iOS 13.0, *) {
            let appearance                     = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor             = Asset.Colors.appDark.color
            appearance.backgroundColor         = Asset.Colors.appWhite.color
            appearance.titleTextAttributes     = titleTextAttributes
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBar.standardAppearance   = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance    = appearance

        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
}

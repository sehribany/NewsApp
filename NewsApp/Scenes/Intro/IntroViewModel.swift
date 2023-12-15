//
//  IntroViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import Utilities
import UIComponents
import MobilliumUserDefaults

protocol IntroViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> IntroCellProtocol
}

protocol IntroViewEventSource {}

protocol IntroViewProtocol: IntroViewDataSource, IntroViewEventSource {}

final class IntroViewModel: BaseViewModel<IntroRouter>, IntroViewProtocol {
    
    private var cellItems : [IntroCellProtocol] = [IntroCellModel(image: Asset.Images.imgIntro1.image,
                                                                  titleText: L10n.WalkThrough.firstTitle,
                                                                  descriptionText: L10n.WalkThrough.descriptionText),
                                                   IntroCellModel(image: Asset.Images.imgIntro2.image,
                                                                        titleText: L10n.WalkThrough.secondTitle,
                                                                        descriptionText: L10n.WalkThrough.descriptionText),
                                                   IntroCellModel(image: Asset.Images.imgIntro3.image,
                                                                        titleText: L10n.WalkThrough.thirdTitle,
                                                                        descriptionText: L10n.WalkThrough.descriptionText)]
    
    func numberOfItemsAt(section: Int) -> Int {
        cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> UIComponents.IntroCellProtocol {
        cellItems[indexPath.row]
    }
}

extension IntroViewModel {
    func finishedIntro() {
        DefaultsKey.isIntroCompleted.value = true
        router.presentMainTabBar()
    }
}

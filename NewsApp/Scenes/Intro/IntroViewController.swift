//
//  IntroViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import UIKit
import TinyConstraints

final class IntroViewController: BaseViewController<IntroViewModel> {
        
    private var pageControl:UIPageControl = {
        let pageControl                           = UIPageControl()
        pageControl.tintColor                     = Asset.Colors.appBlack.color
        pageControl.pageIndicatorTintColor        = Asset.Colors.appBlack.color.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = Asset.Colors.appBlack.color
        pageControl.numberOfPages                 = 3
        return pageControl
    }()
    
    private var nextButton: UIButton = {
        let button                = UIButton()
        button.backgroundColor    = Asset.Colors.appBlack.color
        button.titleLabel?.font   = UIFont.font(.nunitoBold, size: .large)
        button.setTitleColor(Asset.Colors.appWhite.color, for: .normal)
        button.layer.cornerRadius = 10
        
        button.layer.shadowColor   = Asset.Colors.appDark.color.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset  = CGSize(width: 4, height: 4)
        button.layer.shadowRadius  = 5
        button.addGestureRecognizer(UILongPressGestureRecognizer(target: IntroViewController.self, action:  #selector(tappedLongGesture)))
        return button
    }()
        
    private var collectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(IntroCell.self, forCellWithReuseIdentifier: IntroCell.identifier)
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentConfigure()
        addSubViews()
    }
}
// MARK: -UILayout
extension IntroViewController{
    private func addSubViews(){
        addNextButton()
        addPageControl()
        addCollectionView()
    }
    
    private func addNextButton() {
        view.addSubview(nextButton)
        nextButton.bottomToSuperview(usingSafeArea: true)
        nextButton.trailingToSuperview().constant = -25
        nextButton.leadingToSuperview().constant  = 25
        nextButton.height(50)
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.top(to: view)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToTop(of: pageControl).constant = -5
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.centerXToSuperview()
        pageControl.bottomToSuperview(usingSafeArea: true).constant = -70
    }
}

// MARK: -Configure
extension IntroViewController{
    private func contentConfigure(){
        view.backgroundColor                 = Asset.Colors.appWhite.color
        collectionView.delegate              = self
        collectionView.dataSource            = self
        pageControl.isUserInteractionEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.setTitle(L10n.WalkThrough.next, for: .normal)
        let longPressGesture                 = UILongPressGestureRecognizer(target: self, action: #selector(tappedLongGesture(_:)))
        nextButton.addGestureRecognizer(longPressGesture)
    }
}

// MARK: -UICollectionViewDataSource
extension IntroViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsAt(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCell.identifier, for: indexPath) as? IntroCell else {fatalError("Could not dequeu IntroCell")}
        let cellItem   = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: -Actions
extension IntroViewController {
    
    @objc func tappedLongGesture(_ gesture: UILongPressGestureRecognizer) {
            guard let view = gesture.view else { return }
            if gesture.state == .began {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                UIView.animate(withDuration: 0.2, animations: {
                    view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                })
            } else if gesture.state == .ended {
                UIView.animate(withDuration: 0.2, animations: {
                    self.nextButton.transform = .identity
                })
            }
    }
    
    @objc
    private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            viewModel.finishedIntro()
        } else {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IntroViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / width)
        
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(L10n.WalkThrough.start, for: .normal)
        } else {
            nextButton.setTitle(L10n.WalkThrough.next, for: .normal)
        }
    }
 }

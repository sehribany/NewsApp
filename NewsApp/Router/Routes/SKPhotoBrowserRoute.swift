//
//  SKPhotoBrowserRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import SKPhotoBrowser
import UIKit

protocol SKPhotoBrowserRoute{
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate)
}

extension SKPhotoBrowserRoute where Self: RouterProtocol{
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate){
        let skPhotos          = photos.map { SKPhoto.photoWithImageURL($0)}
        let photoBrowser      = SKPhotoBrowser(photos: skPhotos, initialPageIndex: initialPageIndex)
        photoBrowser.delegate = delegate
        viewController.present(photoBrowser, animated: true)
    }
}

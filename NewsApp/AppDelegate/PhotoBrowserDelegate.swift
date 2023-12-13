//
//  PhotoBrowserDelegate.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate{
    var willDismissAtPage: IntClosure?
    
    func willDismissAtPageIndex(_ index: Int) {
        if let didDismiss = willDismissAtPage{
            didDismiss(index)
        }
    }
}

//
//  NewsDetailCard.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import UIKit

public class NewsDetailCardView: UIView {

    private var imageView: UIImageView = {
        let imageView                 = UIImageView()
        imageView.contentMode         = .scaleAspectFill
        imageView.layer.cornerRadius  = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds       = true
        return imageView
    }()

    
}

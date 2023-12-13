//
//  Animator.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//
import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning{
    var isPresenting: Bool {get set}
}

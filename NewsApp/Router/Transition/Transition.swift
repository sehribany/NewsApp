//
//  Transition.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//
import UIKit

protocol Transition: AnyObject{
    var viewController: UIViewController? { get set }
    func open(_ viewController : UIViewController)
    func close(_ viewController: UIViewController)
}

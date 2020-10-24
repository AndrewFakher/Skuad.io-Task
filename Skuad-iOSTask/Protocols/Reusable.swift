//
//  Reusable.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//
import UIKit

protocol Reusable: class {}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension Reusable where Self: UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//
//  RootWireframe.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

protocol RootWireframe: class {
    var rootViewController: UIViewController! {get set}
    func presentRootScreen(in window: UIWindow)
}

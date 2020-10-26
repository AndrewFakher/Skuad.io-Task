//
//  RootRouter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Root Router

class RootRouter: RootWireframe {
    var rootViewController: UIViewController!
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        var rootViewController: UIViewController!
        rootViewController = SearchRouter.assembleSearchModule()
        window.rootViewController = rootViewController
        
    }
}

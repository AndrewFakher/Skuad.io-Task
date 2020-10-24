//
//  Indicatable_Ext.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

fileprivate var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

extension Indicatable where Self: UIViewController {
    
    func showActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.color = .red
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
    }
}

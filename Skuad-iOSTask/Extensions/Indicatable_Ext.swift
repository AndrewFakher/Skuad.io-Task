//
//  Indicatable_Ext.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Activity Indicator Extension

fileprivate var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

extension Indicatable where Self: UIViewController {
    
    func showActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
    }
}

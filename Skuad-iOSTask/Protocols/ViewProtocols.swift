//
//  ViewProtocols.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

//MARK: View Protocols

protocol Indicatable: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}

protocol Alertable: class {
    func showAlert(message: String?)
}


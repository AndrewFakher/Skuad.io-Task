//
//  UITableView_Ext.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Reusing tableview cell extension

extension UITableViewCell: Reusable {}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(":: Unable to dequeue cell with identifier : \(T.reuseIdentifier)")
        }
        return cell
    }
}


//
//  UICollectionView_Ext.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Reusing collectionView cell extension

extension UICollectionViewCell: Reusable {}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(":: Unable to dequeue cell with identifier : \(T.reuseIdentifier)")
        }
        return cell
    }
}

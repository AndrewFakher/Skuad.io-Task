//
//  ImageDetailsVC+CollectionView.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

extension ImageDetailsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   // Setup Image Gallery CollectionView

    func setupImageDetailCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageDetailsCollectionCell.self)
    }
    
    //MARK: CollectionView + DataSource + Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getImageDetailsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ImageDetailsCollectionCell
        presenter?.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
}

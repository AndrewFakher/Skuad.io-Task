//
//  SearchVC+CollectionView.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit
extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Setup Images Collection View

    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.keyboardDismissMode = .onDrag
        collectionView.register(ImageCollectionViewCell.self)
        // setup pinterest layout
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.headerInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumColumnSpacing = 4
        layout.minimumInteritemSpacing = 4
        collectionView.collectionViewLayout = layout
    }
    
    //MARK: CollectionView DataSource + Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getImagesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ImageCollectionViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter.paginateToNextPage(for: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.navigateToImageDetails(for: indexPath.row)
    }
    
}

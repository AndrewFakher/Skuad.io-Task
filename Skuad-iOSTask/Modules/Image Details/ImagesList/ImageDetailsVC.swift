//
//  ImageDetailsVC.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class ImageDetailsVC: UIViewController {
    
    var presenter: ImageDetailsVCPresenter?
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageDetailCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.isHidden = false
        collectionView.scrollToItem(at: IndexPath(row: presenter?.selectedImageIndex ?? 0, section: 0) , at: .centeredHorizontally, animated: false)
    }

}

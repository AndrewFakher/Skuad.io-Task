//
//  ImageDetailsVC.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class ImageDetailsVC: UIViewController {
    
    //MARK: Outlets

    @IBOutlet weak var imageDetailsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    //MARK: Properties

    var presenter: ImageDetailsVCPresenter?
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageDetailCollectionView()
        presenter?.viewDidload()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.isHidden = false
        collectionView.scrollToItem(at: IndexPath(row: presenter?.selectedImageIndex ?? 0, section: 0) , at: .centeredHorizontally, animated: false)
    }
    
}

// MARK: Drag dismiss Image Details View
extension ImageDetailsVC {
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
            
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
}

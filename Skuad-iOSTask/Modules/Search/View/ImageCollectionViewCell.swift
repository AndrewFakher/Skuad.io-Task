//
//  ImageCollectionViewCell.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell,ImageCellView, NibLoadable {

    @IBOutlet weak var imageView: UIView!{
        didSet{
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
            imageView.layer.shadowRadius = 10
            imageView.layer.shadowOffset = .zero
            imageView.layer.shadowOpacity = 3
        }
    }
    
    @IBOutlet weak var searchedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayCellData(imageLink: String) {
        self.setImgURL(imgLink: imageLink)
    }
    
    func setImgURL(imgLink: String){
        searchedImage.sd_setImage(with: URL(string: imgLink), placeholderImage: UIImage(named: "placeholder"))
    }


}

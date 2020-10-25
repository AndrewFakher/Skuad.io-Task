//
//  ImageDetailsCollectionCell.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit
import SDWebImage

class ImageDetailsCollectionCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var imageDetails: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func displayCellData(imageLink: String) {
        self.setImgURL(imgLink: imageLink)
    }
    
    func setImgURL(imgLink: String){
        imageDetails.sd_setImage(with: URL(string: imgLink))
    }

}

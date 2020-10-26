//
//  ImageDetailsRouter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/25/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Image Details Router

class ImageDetailsRouter{
    
    static func assembleImageDetailshModule(index: Int, images: [Image],searchQuery: String) -> UIViewController {
        let imageDetailsVC = mainstoryboard.instantiateViewController(withIdentifier: "ImageDetailsVC")
        if let imageDetailsView = imageDetailsVC as? ImageDetailsViewToPresenter {
            let presenter = ImageDetailsVCPresenter(imageDetailsView: imageDetailsView, index: index, user: images, searchQuery: searchQuery)
            imageDetailsView.presenter = presenter
        }
        return imageDetailsVC
    }

    private static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"ImageDetails",bundle: Bundle.main)
    }

}

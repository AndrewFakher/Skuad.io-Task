//
//  SearchRouter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/25/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class SearchRouter{
    weak var viewController: UIViewController!

    static func assembleSearchModule() -> UIViewController {
        let controller = mainstoryboard.instantiateViewController(withIdentifier: "SearchVC")
        let navigation = UINavigationController(rootViewController: controller)
        return navigation
    }
    
    private static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Search",bundle: Bundle.main)
    }
    
    func goToImageDetails(from view: SearchViewToPresenter?, index: Int, images: [Image]) {
        let ImageDetailsView = ImageDetailsRouter.assembleImageDetailshModule(index: index, images: images)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(ImageDetailsView, animated: true)
        }
    }
}

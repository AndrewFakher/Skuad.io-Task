//
//  ImageDetails+PresenterDelegate.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/25/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

extension ImageDetailsVC: ImageDetailsViewToPresenter{
    func setNavTitle(title: String) {
        imageDetailsLabel.text = title
    }
}

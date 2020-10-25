//
//  ImageDetailsContract.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

protocol ImageDetailsViewToPresenter: class {
    var presenter: ImageDetailsVCPresenter? { get set }
}

//
//  SearchContract.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

protocol SearchViewToPresenter: Alertable, Indicatable {
    func showIndicator()
    func hideIndicator()
    func reloadingCollectionView()
    func showError(error: String)
    func noImagesFoundedView()
    func removeSuggestionView()
}

protocol ImageCellView {
    func displayCellData(imageLink: String)
}

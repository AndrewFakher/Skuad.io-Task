//
//  SearchContract.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

//MARK: Search View Protocols

protocol SearchViewToPresenter: Alertable, Indicatable {
    func showIndicator()
    func hideIndicator()
    func reloadingCollectionView()
    func showError(error: String)
    func noImagesFoundedView()
    func removeSuggestionView()
    func handlingSearchBarText(searchBarText: String)
    func emptytextAlert(msg: String)
}
//MARK: Image Cell Protocols

protocol ImageCellView {
    func displayCellData(imageLink: String)
}

//MARK: Search History Protocols

protocol SearchHistoryCellView {
    func displayCellData(searchHistoryLabel: String)
}

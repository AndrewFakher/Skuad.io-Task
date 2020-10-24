//
//  SearchVC+PresenterDelegate.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

extension SearchVC: SearchViewToPresenter{
    func showIndicator() {
        showActivityIndicator()
    }
    
    func hideIndicator() {
        hideActivityIndicator()
    }
    
    func showError(error: String) {
        self.showAlert(message: error)
    }
    
    func reloadingCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
//            self.noResultView.isHidden = true
        }
    }
    
    func noImagesFoundedView() {
        DispatchQueue.main.async {
//            self.noResultView.isHidden = false
        }
        
    }
    
    func removeSuggestionView() {
//        self.searchHistoryView.isHidden = true
    }
}

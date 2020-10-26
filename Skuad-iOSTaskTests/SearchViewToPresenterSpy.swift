//
//  SearchViewToPresenterSpy.swift
//  Skuad-iOSTaskTests
//
//  Created by Andrew on 10/26/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation
@testable import Skuad_iOSTask

class SearchViewToPresenterSpy: SearchViewToPresenter{
    private(set) var showIndicatorHasBeenCalled: Bool = false
    private(set) var hideIndicatorHasBeenCalled: Bool = false
    private(set) var reloadingCollectionViewHasBeenCalled: Bool = false
    private(set) var showErrorHasBeenCalled: Bool = false
    private(set) var noImagesFoundedViewHasBeenCalled: Bool = false
    private(set) var removeSuggestionViewHasBeenCalled: Bool = false
    private(set) var handlingSearchBarTextHasBeenCalled: Bool = false
    private(set) var showAlertHasBeenCalled: Bool = false
    private(set) var emptytextAlertHasBeenCalled: Bool = false
    private(set) var showActivityIndicatorHasBeenCalled: Bool = false
    private(set) var hideActivityIndicatorHasBeenCalled: Bool = false

    
    func showIndicator(){
        showIndicatorHasBeenCalled = true
    }
    func hideIndicator(){
        hideIndicatorHasBeenCalled = true
    }
    func reloadingCollectionView(){
        reloadingCollectionViewHasBeenCalled = true
    }
    func showError(error: String){
        showErrorHasBeenCalled = true
    }
    func noImagesFoundedView(){
        noImagesFoundedViewHasBeenCalled = true
    }
    func removeSuggestionView(){
        removeSuggestionViewHasBeenCalled = true
    }
    func handlingSearchBarText(searchBarText: String){
        handlingSearchBarTextHasBeenCalled = true
    }
    func emptytextAlert(msg: String){
        emptytextAlertHasBeenCalled = true
    }
    func showAlert(message: String?) {
        showAlertHasBeenCalled = true
    }
    
    func showActivityIndicator() {
        showActivityIndicatorHasBeenCalled = true
    }
    func hideActivityIndicator() {
        hideIndicatorHasBeenCalled = true
    }
    
    
}

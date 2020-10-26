//
//  SearchPresenterTest.swift
//  Skuad-iOSTaskTests
//
//  Created by Andrew on 10/26/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import XCTest
@testable import Skuad_iOSTask

class SearchPresenterTest: XCTestCase {
    private var searchInteractorWithImages: SearchInteractorWithImagesSpy!
    private var searchInteractorWithoutImages: SearchInteractorWithoutImagesSpy!
    private var searchView: SearchViewToPresenterSpy!
    private var searchPresenter: SearchVCPresenter!

    func testOnStartWithProducts() {
        givenSearchInteractorWithImages()
        givenASearchView()
        givenASearchPresenterWith()
    }
    
    private func givenSearchInteractorWithImages() {
        searchInteractorWithImages = SearchInteractorWithImagesSpy()
    }
    private func givenASearchView() {
        searchView = SearchViewToPresenterSpy()
    }
    private func givenASearchPresenterWith() {
        searchPresenter = SearchVCPresenter(view: searchView)
    }
    
    
    private func thenTryToEmptyingTextAlert() {
        XCTAssertFalse(searchView.emptytextAlertHasBeenCalled)
    }
    
    private func thenTheSearchViewShowsLoadingStatus() {
        XCTAssertFalse(searchView.showActivityIndicatorHasBeenCalled)
    }

    private func thenTheSearchViewHidesLoadingStatus() {
        XCTAssertFalse(searchView.hideActivityIndicatorHasBeenCalled)
    }

    private func thenNoImagesViewFounded() {
        XCTAssertTrue(searchView.noImagesFoundedViewHasBeenCalled)
    }
    
    private func thenRemoveSuggestionView() {
        XCTAssertTrue(searchView.removeSuggestionViewHasBeenCalled)
    }
    
    private func thenReloadingCollectionView() {
        XCTAssertTrue(searchView.reloadingCollectionViewHasBeenCalled)
    }
}

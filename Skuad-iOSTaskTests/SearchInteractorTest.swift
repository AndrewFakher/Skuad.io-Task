//
//  SearchInteractorTest.swift
//  Skuad-iOSTaskTests
//
//  Created by Andrew on 10/26/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation
import XCTest

//MARK: Search Interactor Unit Tests

@testable import Skuad_iOSTask

class SearchIneractorTests: XCTestCase {
    private var searchInteractor: SearchInteractor!
    
    func testImagesRetrieved() {
        givenImagesInteractor()
        whenTheInteractorTryToRetrieveImages { [unowned self] images, interactorExpectation in
            self.thenTheImagesListIsRetrieved(images: images,
                                                expectation: interactorExpectation)
        }
        thenTheInteractorFinishedToTryToRetrieve()
    }
    
    private func givenImagesInteractor() {
        searchInteractor = SearchInteractor()
    }
    
    func whenTheInteractorTryToRetrieveImages(finish: @escaping ([Image]?, XCTestExpectation) -> Void) {
        let interactorExpectation = expectation(description: "InteractorExpectation")
        searchInteractor.searchMovie(query: "Pyramids") { images,total,error in
            finish(images,interactorExpectation)
        }
    }
    
    private func thenTheImagesListIsRetrieved(images: [Image]?, expectation: XCTestExpectation) {
        XCTAssertNotNil(images)
        XCTAssertTrue(images!.count > 0)
        expectation.fulfill()
    }
    
    private func thenTheInteractorFinishedToTryToRetrieve() {
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("Interactor finish() not called: \(error)")
            }
        }
    }
}

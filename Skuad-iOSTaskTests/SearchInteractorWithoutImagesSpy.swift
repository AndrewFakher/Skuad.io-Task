//
//  SearchInteractorWithoutImagesSpy.swift
//  Skuad-iOSTaskTests
//
//  Created by Andrew on 10/26/20.
//  Copyright © 2020 Andrew. All rights reserved.
//
import Foundation
import Skuad_iOSTask

@testable import Skuad_iOSTask

class SearchInteractorWithoutImagesSpy {
    private(set) var getImagesHasBeenCalled: Bool = false
    
    func getImages(finish: @escaping ([Image]?) -> Void) {
        getImagesHasBeenCalled = true
        finish(nil)
    }
}


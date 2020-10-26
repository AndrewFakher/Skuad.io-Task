//
//  SearchInteractorWithImagesSpy.swift
//  Skuad-iOSTaskTests
//
//  Created by Andrew on 10/26/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation
import Skuad_iOSTask

@testable import Skuad_iOSTask

class SearchInteractorWithImagesSpy {
    private(set) var getImagesHasBeenCalled: Bool = false
    
    func getImages(finish: @escaping ([Image]?) -> Void) {
        getImagesHasBeenCalled = true
        let images = [Image(largeImageURL: "https://pixabay.com/get/55e6d54a4c54a414f6da8c7dda7936761337daec5a526c48732f78d3944bc65dbd_1280.jpg"),
                      Image(largeImageURL: "https://pixabay.com/get/52e6d7434d52a514f6da8c7dda7936761337daec5a526c48732f78d3944bc65dbd_1280.jpg"),
                      Image(largeImageURL: "https://pixabay.com/get/52e5d2444a54a514f6da8c7dda7936761337daec5a526c48732f78d3944bc65dbd_1280.jpg"),
                      Image(largeImageURL: "https://pixabay.com/get/54e8d3434c57a814f6da8c7dda7936761337daec5a526c48732f78d3944bc65dbd_1280.jpg")
        ]
        finish(images)
    }
}


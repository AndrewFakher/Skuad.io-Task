//
//  ImageDetailsPresenter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

class ImageDetailsVCPresenter {
    
    private weak var view: ImageDetailsViewToPresenter?
    
    private var imageDetailsList = [Image]()
    var selectedImageIndex = 0

    init(imageDetailsView: ImageDetailsViewToPresenter?,index: Int, user: [Image]) {
        self.view = imageDetailsView
        self.imageDetailsList = user
        self.selectedImageIndex = index
    }
    
    func getImageDetailsCount() -> Int {
        return imageDetailsList.count
    }
    
    func configure(cell: ImageDetailsCollectionCell, for index: Int) {
        let image = imageDetailsList[index]
        let imageURL = image.largeImageURL
        cell.displayCellData(imageLink: imageURL ?? "")
    }
}

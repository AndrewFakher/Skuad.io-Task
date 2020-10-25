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
    private var navString = String()
    var selectedImageIndex = 0
    
    init(imageDetailsView: ImageDetailsViewToPresenter?,index: Int, user: [Image], searchQuery: String) {
        self.view = imageDetailsView
        self.imageDetailsList = user
        self.selectedImageIndex = index
        self.navString = searchQuery
    }
    
    func getImageDetailsCount() -> Int {
        return imageDetailsList.count
    }
    
    func configure(cell: ImageDetailsCollectionCell, for index: Int) {
        let image = imageDetailsList[index]
        let imageURL = image.largeImageURL
        cell.displayCellData(imageLink: imageURL ?? "")
    }
    
    func viewDidload(){
        self.view?.setNavTitle(title: navString)
    }
}

//
//  ImageDetailsPresenter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

//MARK: Image Details Presenter

class ImageDetailsVCPresenter {
    
    //MARK: Properties

    private weak var view: ImageDetailsViewToPresenter?
    private var imageDetailsList = [Image]()
    private var navString = String()
    var selectedImageIndex = 0
    
    // initializing controller data
    init(imageDetailsView: ImageDetailsViewToPresenter?,index: Int, user: [Image], searchQuery: String) {
        self.view = imageDetailsView
        self.imageDetailsList = user
        self.selectedImageIndex = index
        self.navString = searchQuery
    }
    
    // get images gallery count
    func getImageDetailsCount() -> Int {
        return imageDetailsList.count
    }
    
    // passing selected image to its cell
    func configure(cell: ImageDetailsCollectionCell, for index: Int) {
        let image = imageDetailsList[index]
        let imageURL = image.largeImageURL
        cell.displayCellData(imageLink: imageURL ?? "")
    }
    
    // set navigation label title
    func viewDidload(){
        self.view?.setNavTitle(title: navString)
    }
}

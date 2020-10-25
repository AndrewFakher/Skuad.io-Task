//
//  SearchVCPresenter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class SearchVCPresenter{
    
    private weak var view: SearchViewToPresenter?
    private let interactor = SearchInteractor()
    private let router = SearchRouter()

    var images = [Image]()
    private var searchHistoryList = [String]()

    private var page = 1
    private var total = 1
    private var query = String()
    var searchedQuery = String()
    
    init(view: SearchViewToPresenter){
        self.view = view
    }
    
    func getSearchedImages(query:String){
        view?.showIndicator()
        interactor.searchMovie(query: query) { images, total, error in
            self.view?.hideIndicator()
            self.query = query
            guard let images = images else {return}
            guard let total = total else {return}
            if images.count == 0 {self.view?.noImagesFoundedView()}
            else {
                UserDefaultHelper.addSuggestion(suggestion: query)
                self.images = images
                self.page = 1
                self.total = total
                self.view?.reloadingCollectionView()
            }
            if let error = error{
                self.view?.showError(error: error)
            }
        }
    }
    
    func loadMoreImages(query:String,page:Int){
        view?.showIndicator()
        interactor.loadMoreImages(query: query, page: page + 1) { images, error in
            self.view?.hideIndicator()
            guard let images = images else {return}
            self.images.append(contentsOf: images)
            self.page += 1
            self.view?.reloadingCollectionView()
        }
    }
    
    func getImagesCount() -> Int {
        return images.count
    }
    
    func getSearchHistoryCount() -> Int {
        return searchHistoryList.count
    }
    
    func emptyingImageArray(){
        images.removeAll()
        self.view?.reloadingCollectionView()
    }
    
    func removeSuggestionView(){
        self.view?.removeSuggestionView()
    }
    
    func emptyingSearchHistoryArray(){
        searchHistoryList.removeAll()
    }
    
    func updateSearchHistoryList(){
        searchHistoryList = UserDefaultHelper.getSuggestionList()
    }
    
    func addSearchBarText(text: String){
        self.view?.handlingSearchBarText(searchBarText: text)
    }
    func enteringEmptyText(msg: String){
        self.view?.showAlert(message: msg)
    }
    func paginateToNextPage(for index: Int){
        if index == images.count - 1{
            if images.count < total {
                loadMoreImages(query: query, page: page)
            }
        }
    }
    
    func configure(cell: ImageCollectionViewCell, for index: Int) {
        let image = images[index]
        let imageURL = image.largeImageURL
        cell.displayCellData(imageLink: imageURL ?? "")
    }
    
    func configureSearchHistoryCell(cell: SearchHistoryTVC, for index: Int) {
        let searchHistory = searchHistoryList[index]
        cell.displayCellData(searchHistoryLabel: searchHistory)
    }
    
    func searchHistoryClicked(for index: Int){
        searchedQuery = searchHistoryList[index]
        addSearchBarText(text: searchedQuery)
        removeSuggestionView()
        getSearchedImages(query: searchedQuery)
    }
    
    func navigateToImageDetails(for index: Int){
        router.goToImageDetails(from: view, index: index, images: images, searchQuery: query)
    }
}

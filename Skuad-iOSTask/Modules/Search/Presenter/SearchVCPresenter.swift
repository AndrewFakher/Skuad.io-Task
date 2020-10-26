//
//  SearchVCPresenter.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Search Presenter
class SearchVCPresenter{
    
    //MARK: Properties
    
    private weak var view: SearchViewToPresenter?
    private let interactor = SearchInteractor()
    private let router = SearchRouter()

    private var images = [Image]()
    private var searchHistoryList = [String]()

    private var page = 1
    private var total = 1
    private var query = String()
    private var searchedQuery = String()
    
   // Injecting View To Presenter
    
    init(view: SearchViewToPresenter){
        self.view = view
    }
    
    // Get Searched Image Request
    
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
    // Load More Images Request

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
    
    // Images Count

    func getImagesCount() -> Int {
        return images.count
    }
    // Search History Count

    func getSearchHistoryCount() -> Int {
        return searchHistoryList.count
    }
    
    // Emptying Images Array

    func emptyingImageArray(){
        images.removeAll()
        self.view?.reloadingCollectionView()
    }
    
    // Remove Suggestion TableView

    func removeSuggestionView(){
        self.view?.removeSuggestionView()
    }
    // Emptying Search History TableView

    func emptyingSearchHistoryArray(){
        searchHistoryList.removeAll()
    }
    // Get Search History From UserDefaults

    func updateSearchHistoryList(){
        searchHistoryList = UserDefaultHelper.getSuggestionList()
    }
    
    //Handling Selected Text From SearchHistory TableView

    func addSearchBarText(text: String){
        self.view?.handlingSearchBarText(searchBarText: text)
    }
    
    // Handling State of entering empty text of searchbar
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
    
    // passing selected image index to its cell
    func configure(cell: ImageCollectionViewCell, for index: Int) {
        let image = images[index]
        let imageURL = image.largeImageURL
        cell.displayCellData(imageLink: imageURL ?? "")
    }
    
    // passing selected search history to its cell
    func configureSearchHistoryCell(cell: SearchHistoryTVC, for index: Int) {
        let searchHistory = searchHistoryList[index]
        cell.displayCellData(searchHistoryLabel: searchHistory)
    }
    
    // search history selected text query
    func searchHistoryClicked(for index: Int){
        searchedQuery = searchHistoryList[index]
        addSearchBarText(text: searchedQuery)
        removeSuggestionView()
        getSearchedImages(query: searchedQuery)
    }
    
    // navigating to gallery
    func navigateToImageDetails(for index: Int){
        router.goToImageDetails(from: view, index: index, images: images, searchQuery: query)
    }
}

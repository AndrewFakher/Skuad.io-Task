//
//  SearchVC+SearchDelegate.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit
extension SearchVC: UISearchBarDelegate{
    // Setup SearchBar
    
    func setupSearchBar(){
        searchBar.placeholder = "Search...."
        searchBar.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.delegate = self
    }
    
    //MARK: SearchBar Delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.queryString = searchText
        if searchText.isEmpty {
            isSearching = false
            searchBar.text = ""
            presenter.emptyingImageArray()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
         showSuggestionView()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        removeSuggestionView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchedText = searchBar.text else {return}
        if !searchedText.trimmingCharacters(in: .whitespaces).isEmpty {
            presenter.emptyingImageArray()
            presenter.removeSuggestionView()
            presenter.getSearchedImages(query: queryString)
        }else {
            searchBar.text = ""
            presenter.enteringEmptyText(msg: "Search can't be empty")
        }
    }
}


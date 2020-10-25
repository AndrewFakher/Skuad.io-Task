//
//  SearchVC+SearchDelegate.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit
extension SearchVC: UISearchBarDelegate{
    func setupSearchBar(){
        searchBar.placeholder = "Search...."
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.delegate = self
    }
    
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


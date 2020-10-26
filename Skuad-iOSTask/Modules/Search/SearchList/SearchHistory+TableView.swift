//
//  SearchHistory+TableView.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

extension SearchVC: UITableViewDataSource, UITableViewDelegate{
    // Setup Search History TableView

    func setupSearchHistoryTableView(){
        searchHistoryTableView.delegate = self
        searchHistoryTableView.dataSource = self
        searchHistoryTableView.register(SearchHistoryTVC.self)
    }
    
    // Show SearchHistory TableView

    func showSuggestionView(){
        searchBar.text = ""
        presenter.emptyingSearchHistoryArray()
        presenter.updateSearchHistoryList()
        if presenter.getSearchHistoryCount() > 0 {
            searchHistoryView.isHidden = false
            searchHistoryTableView.reloadData()
            if CGFloat(presenter.getSearchHistoryCount() * 30) < 300.0 {
                searchHistoryTableHeight.constant = CGFloat(presenter.getSearchHistoryCount() * 30)
            }else {
                searchHistoryTableHeight.constant = 300.0
            }
        }
    }
    
    //MARK: Search TableView DataSource + Delegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getSearchHistoryCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SearchHistoryTVC
        presenter.configureSearchHistoryCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.emptyingImageArray()
        presenter.searchHistoryClicked(for: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    
    
}

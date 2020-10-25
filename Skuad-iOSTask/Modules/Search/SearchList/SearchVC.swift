//
//  ViewController.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchHistoryTableHeight: NSLayoutConstraint!
    @IBOutlet weak var searchHistoryTableView: UITableView!
    @IBOutlet weak var searchHistoryView: UIView!
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: SearchVCPresenter!
    var isSearching = false
    var queryString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red
        setupCollectionView()
        setupSearchBar()
        setupSearchHistoryTableView()
        presenter = SearchVCPresenter(view: self)
    }

    @IBAction func closeTapped(_ sender: Any) {
        removeSuggestionView()
    }
    
}



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
    
    var presenter: SearchVCPresenter!
    var isSearching = false
    var queryString = String()
    lazy var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        setupCollectionView()
        setupSearchBar()
        setupSearchHistoryTableView()
        presenter = SearchVCPresenter(view: self)
    }
    
}



//
//  SearchHistoryTVC.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: Search history cell
class SearchHistoryTVC: UITableViewCell, NibLoadable, SearchHistoryCellView {

    //MARK: Properties
    @IBOutlet weak var searchHistoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // displaying cell data
    func displayCellData(searchHistoryLabel: String) {
        self.searchHistoryLabel.text = searchHistoryLabel
    }
}

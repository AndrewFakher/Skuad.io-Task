//
//  SearchHistoryTVC.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class SearchHistoryTVC: UITableViewCell, NibLoadable, SearchHistoryCellView {

    
    @IBOutlet weak var searchHistoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayCellData(searchHistoryLabel: String) {
        self.searchHistoryLabel.text = searchHistoryLabel
    }
}

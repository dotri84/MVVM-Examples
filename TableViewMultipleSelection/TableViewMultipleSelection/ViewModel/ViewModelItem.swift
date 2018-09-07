//
//  ViewModelItem.swift
//  TableViewMultipleSelection
//
//  Created by Do Tri on 9/7/18.
//  Copyright © 2018 Do Tri. All rights reserved.
//

import UIKit

class ViewModelItem {
    private var item: Item!
    init(item: Item) {
        self.item = item
    }
    
    var title : String {
        return item.title
    }
    
    var isSelected = false
}

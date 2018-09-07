//
//  ViewModel.swift
//  TableViewMultipleSelection
//
//  Created by Do Tri on 9/7/18.
//  Copyright © 2018 Do Tri. All rights reserved.
//

import UIKit

let dataArray = [Item(title: "Swift"),
                 Item(title: "Objective C"),
                 Item(title: "Java"),
                 Item(title: "Kotlin"),
                 Item(title: "Java Script"),
                 Item(title: "Python"),
                 Item(title: "Ruby"),
                 Item(title: "PHP"),
                 Item(title: "Perl"),
                 Item(title: "Go"),
                 Item(title: "C#"),
                 Item(title: "C++"),
                 Item(title: "Visual Basic"),
                 Item(title: "Pascal")]

class ViewModel : NSObject {
    var items : [ViewModelItem]!
    var selectedItems : [ViewModelItem]!
    override init() {
        items = dataArray.map{ ViewModelItem(item: $0) }
        selectedItems = [ViewModelItem]()
    }
    
    var didToggleSelection: ((_ hasSelection: Bool) -> ())? {
        didSet {
            didToggleSelection?(!selectedItems.isEmpty)
        }
    }
    
    func reloadData() {
        selectedItems.removeAll()
        for item in items {
            if item.isSelected {
                selectedItems.append(item)
            }
        }
    }
}



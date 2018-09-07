//
//  CustomCell.swift
//  TableViewMultipleSelection
//
//  Created by Do Tri on 9/7/18.
//  Copyright © 2018 Do Tri. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var item: ViewModelItem! {
        didSet {
            self.textLabel?.text = item.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        accessoryType = selected ? .checkmark : .none
        selectionStyle = .none
    }

}

//
//  BaseTableCell.swift
//  MoviesApp
//
//  Created by Shehryar on 04/09/2023.
//

import UIKit

class BaseTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}

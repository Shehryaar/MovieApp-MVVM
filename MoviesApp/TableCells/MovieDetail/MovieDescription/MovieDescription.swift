//
//  MovieDescription.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieDescription: BaseTableCell {

    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var descriptionText: String? {
        didSet {
            updateCell()
        }
    }
    
    // MARK: - Private funcs
    
    private func updateCell() {
        descriptionLabel.text = descriptionText
    }
}

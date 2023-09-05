//
//  MovieDataCell.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieDataCell: BaseTableCell {
    
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var releasedDateLabel: UILabel!
    
    // MARK: - Cell Config Func
    
    func configureCell(genre: String, releasedDate: String) {
        genreLabel?.text = genre
        releasedDateLabel?.text = releasedDate
    }
}

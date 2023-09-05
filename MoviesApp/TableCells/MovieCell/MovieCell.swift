//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieCell: BaseTableCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var watchlistButton: UIButton!
    @IBOutlet private weak var movieImageview: UIImageView!
    
    // MARK: - Cell Config Func
    
    func configureCell(_ data: MoviePresentation?) {
        titleLabel.attributedText = data?.attributedTitle
        watchlistButton.isHidden = data?.isUnderWatchlist == false
        movieImageview.image = UIImage(named: data?.image ?? "")
    }
}

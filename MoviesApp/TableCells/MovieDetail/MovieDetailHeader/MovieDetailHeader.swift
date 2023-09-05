//
//  MovieDetailHeader.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieDetailHeader: BaseTableCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var watchlistButton: UIButton!
    @IBOutlet private weak var watchTrailerButton: UIButton!
    @IBOutlet private weak var movieImageview: UIImageView!
    
    var trailerHandler: StringHandler?
    var watchlistHandler: StringHandler?
    
    var presentation: MoviePresentation? {
        didSet {
            updateCell()
        }
    }
    
    // MARK: - Private funcs
    
    private func updateCell() {
        titleLabel.text = presentation?.title
        ratingLabel.attributedText = presentation?.ratingTitle
        watchlistButton.setTitle(presentation?.isUnderWatchlist == true ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST", for: .normal)
        movieImageview.image = UIImage(named: presentation?.image ?? "")
    }
    
    @IBAction private func trailerAction() {
        trailerHandler?(presentation?.trailerLink ?? "")
    }
    
    @IBAction private func watchlistAction() {
        watchlistHandler?(presentation?.title ?? "")
    }
}

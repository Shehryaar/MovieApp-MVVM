//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import Foundation

final class MovieDetailViewModel {
    
    private let presentation: MoviePresentation
    
    let dataSource: [DataSource]
    
    enum DataSource {
        case header(presentation: MoviePresentation)
        case movieDescription(text: String)
        case movieDetail(genre: String, duration: String)
    }
    
    // MARK: - Initialization
    
    init(presentation: MoviePresentation) {
        self.presentation = presentation
        
        // Prepare data source
        dataSource = [.header(presentation: presentation),
                      .movieDescription(text: presentation.description),
                      .movieDetail(genre: presentation.genre, duration: presentation.duration)]
    }
}

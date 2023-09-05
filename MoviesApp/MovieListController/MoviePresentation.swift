//
//  MoviePresentation.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import Foundation
import UIKit

struct MoviePresentation {
    let title: String
    let image: String
    let description: String
    let rating: Float
    let duration: String
    let genre: String
    let releasedDate: String
    let trailerLink: String
    
    init(title: String,
         image: String,
         description: String,
         rating: Float,
         duration: String,
         genre: String,
         releasedDate: String,
         trailerLink: String) {
        self.title = title
        self.image = image
        self.description = description
        self.rating = rating
        self.duration = duration
        self.genre = genre
        self.releasedDate = releasedDate
        self.trailerLink = trailerLink
    }
    
    var attributedTitle: NSMutableAttributedString {
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
        
        let spaceAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 5, weight: .regular)]
        
        let detailAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)]

        let title = NSMutableAttributedString(string: title, attributes: titleAttributes)
        let space = NSMutableAttributedString(string: "\n\n", attributes: spaceAttributes)
        let detail = NSMutableAttributedString(string: "\(duration) - \(genre)", attributes: detailAttributes)

        title.append(space)
        title.append(detail)
        
        return title
    }
    
    
    var ratingTitle: NSMutableAttributedString {
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        
        let detailAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]

        let title = NSMutableAttributedString(string: "\(rating)", attributes: titleAttributes)
        let detail = NSMutableAttributedString(string: "/10", attributes: detailAttributes)
        
        title.append(detail)
        
        return title
    }
    
    var isUnderWatchlist: Bool {
        return UserDefaults.standard.object(forKey: title) != nil
    }
}

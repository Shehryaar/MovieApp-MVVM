//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import Foundation

final class HomeViewModel {
    
    var moviesPresentation: [MoviePresentation]?
    
    private var isSortedByTitle: Bool?
    
    // MARK: - Initialization
    
    init() {
        moviesPresentation = [
            MoviePresentation(title: "Tenet", image: "img-tenet", description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.", rating: 7.8, duration: "2h 30 min", genre: "Action, Sci-Fi", releasedDate: "3 September 2020", trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo"),
            MoviePresentation(title: "Spider-Man: Into the Spider-Verse", image: "img-spider-man", description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.", rating: 8.4, duration: "1h 57min", genre: "Action, Animation, Adventure", releasedDate: "14 December 2018", trailerLink: "https://www.youtube.com/watch?v=tg52up16eq0"),
            MoviePresentation(title: "Knives Out", image: "img-knives-out", description: "A detective investigates the death of a patriarch of an eccentric, combative family.", rating: 7.9, duration: "2h 10min", genre: "Comedy, Crime, Drama", releasedDate: "27 November 2019", trailerLink: "https://www.youtube.com/watch?v=qGqiHJTsRkQ"),
            MoviePresentation(title: "Guardians of the Galaxy", image: "img-guardians-of-the-galaxy", description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.", rating: 8.0, duration: "2h 1min", genre: "Action, Adventure, Comedy", releasedDate: "1 August 2014", trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA"),
            MoviePresentation(title: "Avengers: Age of Ultron", image: "img-avengers", description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.", rating: 7.3, duration: "2h 21min", genre: "Action, Adventure, Sci-Fi", releasedDate: "1 May 2015", trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do")]
    }
    
    func sortByTitle() {
        isSortedByTitle = true
        moviesPresentation = moviesPresentation?.sorted { $0.title.lowercased() < $1.title.lowercased() }
    }
    
    func sortByDate() {
        isSortedByTitle = false
        moviesPresentation = moviesPresentation?.sorted { $0.releasedDate.format(style: "d MMMM yyyy") > $1.releasedDate.format(style: "d MMMM yyyy") }
    }
}

extension String {
    func format(style: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = style
        return dateFormatter.date(from: self) ?? Date()
    }
}

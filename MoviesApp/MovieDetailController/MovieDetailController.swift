//
//  MovieDetailController.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieDetailController: UIViewController,
                                     UITableViewDelegate,
                                     UITableViewDataSource {
    
    var viewModel: MovieDetailViewModel?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieDescription", bundle: nil), forCellReuseIdentifier: "MovieDescription")
        tableView.register(UINib(nibName: "MovieDetailHeader", bundle: nil), forCellReuseIdentifier: "MovieDetailHeader")
        tableView.register(UINib(nibName: "MovieDataCell", bundle: nil), forCellReuseIdentifier: "MovieDataCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel?.dataSource[indexPath.row]
        
        switch data {
        case .header(let presentation):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailHeader", for: indexPath) as? MovieDetailHeader else {
                return UITableViewCell()
            }
            cell.presentation = presentation
            
            cell.trailerHandler = { link in
                guard let url = URL(string: link) else {
                    return
                }
                UIApplication.shared.open(url)
            }
            
            cell.watchlistHandler = { title in
                if presentation.isUnderWatchlist {
                    UserDefaults.standard.removeObject(forKey: title)
                } else {
                    UserDefaults.standard.set(title, forKey: title)
                }
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
            return cell
        case .movieDetail(let genre, let duration):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDataCell", for: indexPath) as? MovieDataCell else {
                return UITableViewCell()
            }
            cell.configureCell(genre: genre, releasedDate: duration)
            return cell
        case .movieDescription(let text):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDescription", for: indexPath) as? MovieDescription else {
                return UITableViewCell()
            }
            cell.descriptionText = text
            return cell
        default:
            return UITableViewCell()
        }
    }
}

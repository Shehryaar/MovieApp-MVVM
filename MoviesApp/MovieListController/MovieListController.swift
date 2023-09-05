//
//  MovieListController.swift
//  MoviesApp
//
//  Created by Shehryar on 03/09/2023.
//

import UIKit

final class MovieListController: UIViewController,
                                 UITableViewDelegate,
                                 UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTitle()
        tableView.reloadData()
    }
    
    private func configureTitle() {
        self.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    private func configureNavigationBarButton() {
        let sortButton = UIBarButtonItem(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(displaySortOptions)
        )
        navigationItem.rightBarButtonItem = sortButton
    }
    
    
    @objc private func displaySortOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Title", style: .default , handler: { [weak self] UIAlertAction in
            guard let self else {
                return
            }
            viewModel.sortByTitle()
            tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Released Date", style: .default , handler: { [weak self] UIAlertAction in
            guard let self else {
                return
            }
            viewModel.sortByDate()
            tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesPresentation?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        cell.configureCell(viewModel.moviesPresentation?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieDetailController = storyboard?.instantiateViewController(withIdentifier: "MovieDetail") as? MovieDetailController {
            navigationController?.pushViewController(movieDetailController, animated: true)
            if let presentation = viewModel.moviesPresentation?[indexPath.row] {
                movieDetailController.viewModel = MovieDetailViewModel(presentation: presentation)
            }
        }
    }
}

//
//  CharacterViewController.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import UIKit

class ListCharactersViewController: UITableViewController {
    
    var viewModel: CharactersViewModelProtocol = CharactersViewModel(service: ServiceAPI())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        tableView.register(ListCharactersCell.self, forCellReuseIdentifier: CharactersConstants.Controller.identifierCell)
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCharacters()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersConstants.Controller.identifierCell, for: indexPath) as? ListCharactersCell else { return UITableViewCell() }

        let char = viewModel.getCharacter(at: indexPath.row)
        cell.setupCellInformation(with: char)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsCharacterViewController(viewModel: DetailsCharacterViewModel(charater: viewModel.getCharacter(at: indexPath.row)))
        Task {
            try await vc.episodeViewModel.getEpisodes() 
            navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    private func setupNavigation() {
        navigationController?.navigationItem.title = CharactersConstants.Controller.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ListCharactersViewController: ListCharactersDelegate {
    func showError(_ error: ResponseError) {
        let alert = UIAlertController(title: CharactersConstants.Controller.alertErrorTitle, message: error.description, preferredStyle: .alert)
        let action = UIAlertAction(title: CharactersConstants.Controller.alertButtonTitle, style: .default) { [weak self] action in
            self?.viewModel.listAllCharacters()
            self?.tableView.reloadData()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

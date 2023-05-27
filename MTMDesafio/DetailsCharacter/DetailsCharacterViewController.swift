//
//  DetailsCharacterViewController.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import UIKit

class DetailsCharacterViewController: UIViewController {

    lazy var detailsView: DetailsCharacterView = {
        let view = DetailsCharacterView()
        return view
    }()
    
    var viewModel: DetailsCharacterViewModelProtocol
    var episodeViewModel: EpisodeViewModel
    
    init(viewModel: DetailsCharacterViewModelProtocol) {
        self.viewModel = viewModel
        self.episodeViewModel = EpisodeViewModel(episodesURL: viewModel.character.episode ?? [])
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        detailsView.setupView()
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.setupInfo(with: viewModel.character)
        detailsView.buttonEpisode.addTarget(self, action: #selector(showEpisode), for: .touchUpInside)
        setupDelegate()
    }
    
    override func viewWillAppear(_ animeted: Bool) {
        super.viewWillAppear(animeted)
        navigationController?.navigationBar.prefersLargeTitles = false
        detailsView.picker.reloadAllComponents()
    }
    
    private func setupDelegate() {
        detailsView.picker.delegate = self
        detailsView.picker.dataSource = self
        episodeViewModel.delegate = self
    }
    
    @objc
    private func showEpisode() {
        detailsView.picker.reloadAllComponents()
        detailsView.picker.isHidden = detailsView.picker.isHidden ? false : true
    }
}

extension DetailsCharacterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        episodeViewModel.numberOfRows()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        episodeViewModel.getNameOfEpisode(at: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        episodeViewModel.showEpisodeInformation(at: row)
    }
}

extension DetailsCharacterViewController: EpisodeDetailsDelegate {
    func showError(_ error: ResponseError) {
        let alert = UIAlertController(title: CharactersConstants.Controller.alertErrorTitle, message: error.description, preferredStyle: .alert)
        let action = UIAlertAction(title: CharactersConstants.Controller.alertButtonTitle, style: .default) { [weak self] action in
            self?.detailsView.picker.isHidden = true
            self?.detailsView.picker.reloadAllComponents()
        }
        
        let actionCancel = UIAlertAction(title: CharactersConstants.Controller.alertButtonClosed, style: .destructive)
        alert.addAction(action)
        alert.addAction(actionCancel)
        self.present(alert, animated: true)
    }
}

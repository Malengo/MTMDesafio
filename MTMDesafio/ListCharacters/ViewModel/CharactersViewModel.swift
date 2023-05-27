//
//  CharactersViewModel.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 19/05/23.
//

import Foundation

protocol CharactersViewModelProtocol {
    func listAllCharacters()
    func numberOfCharacters() -> Int
    func getCharacter(at index: Int) -> Character
    
    var delegate: ListCharactersDelegate? { get set }
}

protocol ListCharactersDelegate: AnyObject {
    func showError(_ error: ResponseError)
}

class CharactersViewModel: CharactersViewModelProtocol {
   
    private var service: ServiceAPIProtocol
    private var characters: [Character] = []
    weak var delegate: ListCharactersDelegate?
    
    init(service: ServiceAPIProtocol) {
        self.service = service
        listAllCharacters()
    }
    
    
    func listAllCharacters() {
        service.getAllCharacters() { [weak self] result in
            switch result {
            case .success(let data):
                self?.characters = data
            case.failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
    
    func numberOfCharacters() -> Int { characters.count }
    
    func getCharacter(at index: Int) -> Character { characters[index] }
    
}

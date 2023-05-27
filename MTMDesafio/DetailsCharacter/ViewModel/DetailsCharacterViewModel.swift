//
//  DetailsCharacterViewModel.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import Foundation

protocol DetailsCharacterViewModelProtocol {
    var character: Character { get set }
}

struct DetailsCharacterViewModel: DetailsCharacterViewModelProtocol {
    
    var character: Character
    
    init(charater: Character) {
        self.character = charater
    }
}

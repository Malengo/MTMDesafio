//
//  CharactersViewModelMock.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 21/05/23.
//

import Foundation
@testable import MTMDesafio

class CharactersViewModelMock: CharactersViewModelProtocol {
    
    var delegate: ListCharactersDelegate?
        
    var wasListAllCharactersCalled = false
    var wasNumberOfCharactersCalled = false
    var wasGetCharacterCalled = false
    var json = Bundle.main.url(forResource: "mockJson", withExtension: "json")
    
    func listAllCharacters() {
        wasListAllCharactersCalled = true
    }
    
    func numberOfCharacters() -> Int {
        wasNumberOfCharactersCalled = true
        return 0
    }
    
    func getCharacter(at index: Int) -> Character {
        wasGetCharacterCalled = true
        
        return getCharacterMock()
    }  
    
    func getCharacterMock() -> Character {
        let bundle = Bundle(for: type(of: self))
        if let fileURL = bundle.url(forResource: "mockJson", withExtension: "json"){
            do {
                let jsonData = try Data(contentsOf: fileURL)
                return try JSONDecoder().decode(Character.self, from: jsonData)
            } catch {
                return Character()
            }
        }
        return Character()
    }
}

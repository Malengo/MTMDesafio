//
//  ServiceAPIMock.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 22/05/23.
//

import Foundation
@testable import MTMDesafio

class ServiceAPIMock: ServiceAPIProtocol {
        
    var wasGetAllCharactersCalled = false
    
    var getAllCharactersCompletionHandler: Result<[Character], ResponseError>?

func getAllCharacters(_ completion: @escaping (Result<[Character], ResponseError>) -> Void) {
    wasGetAllCharactersCalled = true
    if let getAllCharactersCompletionHandler = getAllCharactersCompletionHandler {
        completion(getAllCharactersCompletionHandler)
    }
}
    
}


//
//  ListCharactersDelegateMock.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 22/05/23.
//

import Foundation
@testable import MTMDesafio

class ListCharactersDelegateMock: ListCharactersDelegate {
        
    var wasShowErrorCalled = false
    var error: ResponseError?
    func showError(_ error: ResponseError) {
        wasShowErrorCalled = true
        self.error = error
    }
    
}

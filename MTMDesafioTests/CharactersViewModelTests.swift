//
//  CharactersViewModelTests.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 22/05/23.
//

import XCTest
@testable import MTMDesafio
class CharactersViewModelTests: XCTestCase {
    
    var sut: CharactersViewModel!
    var service: ServiceAPIMock!
    var delegate: ListCharactersDelegateMock!

    override func setUpWithError() throws {
        service = ServiceAPIMock()
        delegate = ListCharactersDelegateMock()
        sut = CharactersViewModel(service: service)
    }

    override func tearDownWithError() throws {
        service = nil
        sut = nil
    }

    func testListAllCharactersMustCallGetAllCharactersServiceWithSuccess() {
        //Given
        let expectedCharacter = getCharacterMock()
        service.getAllCharactersCompletionHandler = Result.success([expectedCharacter])
        
        //When
        sut.listAllCharacters()
        
        //Then
        XCTAssertEqual(sut.numberOfCharacters(), 1)
        XCTAssertTrue(service.wasGetAllCharactersCalled)
    }
    
    func testLisAllCharactersMustCallGetAllCharactersServiceWithFailure() {
        //Given
        sut.delegate = delegate
        service.getAllCharactersCompletionHandler = Result.failure(.invalidData)
        
        //When
        sut.listAllCharacters()
        
        //Then
        XCTAssertTrue(delegate.wasShowErrorCalled)
        let _ = try? XCTUnwrap(delegate.error)
    }
    
    func testnumberOfCharactersMustReturnCharacterCount() {
        //Given
        let expectedCharacter = getCharacterMock()
        service.getAllCharactersCompletionHandler = Result.success([expectedCharacter])
        sut.listAllCharacters()
        
        //When
        let count = sut.numberOfCharacters()
        
        //Then
        XCTAssertEqual(count, 1)
    }
    
    func testGetCharacterMustReturnOneCharacterInfo() {
        //Given
        let expectedCharacter = getCharacterMock()
        service.getAllCharactersCompletionHandler = Result.success([expectedCharacter])
        sut.listAllCharacters()
        
        //When
        let char = sut.getCharacter(at: 0)
        
        //Then
        XCTAssertEqual(char.name, "Rick Sanchez")
    }

}

extension CharactersViewModelTests {
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

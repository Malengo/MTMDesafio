//
//  MTMDesafioTests.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 21/05/23.
//

import XCTest
@testable import MTMDesafio

class ListCharactersViewControllerTests: XCTestCase {
    
    var sut: ListCharactersViewController!

    override func setUpWithError() throws {
        sut = ListCharactersViewController()
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewDidLoadMustConfigureTableView() {
        //Given
        
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssertTrue(sut.tableView.dequeueReusableCell(withIdentifier: "cell") is ListCharactersCell)
    }
    
    func testViewDidLoadMustSetupNavigation() {
        //Given
        let title = "Rick and Morty"
        let navigation = UINavigationController()
        navigation.viewControllers = [sut]
        
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssertEqual(navigation.navigationItem.title, title)
        XCTAssertTrue(navigation.navigationBar.prefersLargeTitles)
    }
    
    func testViewDidAppearMustCalledViewModelMethods() {
        //Given
        let viewModel = CharactersViewModelMock()
        sut.viewModel = viewModel
        
        //When
        sut.viewDidAppear(true)
        
        //Then
        XCTAssertTrue(viewModel.wasNumberOfCharactersCalled)
    }
    
    func testCellForRowAtMustCalledGetCharacter() {
        //Given
        let viewModel = CharactersViewModelMock()
        sut.viewModel = viewModel
        sut.viewDidLoad()
        
        //When
        let cell = sut.tableView(UITableView(), cellForRowAt: IndexPath())
        
        //Then
        XCTAssertTrue(viewModel.wasGetCharacterCalled)
        XCTAssertTrue(cell is ListCharactersCell)
    }
    
    func testDidSelectRowAtMustCalledPushViewController() {
        //Given
        let viewModel = CharactersViewModelMock()
        sut.viewModel = viewModel
        let expectation = expectation(description: "Waiting for Navigation psuhViewController to be called")
        let navigation = UINavigationControllerSpy()
        navigation.viewControllers = [sut]
        
        navigation.pushViewControllerCompletionHandler = { viewContrller, animated in
            XCTAssertTrue(viewContrller is DetailsCharacterViewController)
            XCTAssertTrue(animated)
            expectation.fulfill()
        }
        
        sut.viewDidLoad()
        
        //When
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 1, section: 1))
        
        //Then
        waitForExpectations(timeout: 1)
        XCTAssertTrue(navigation.wasPushViewControllerCalled)
        XCTAssertTrue(viewModel.wasGetCharacterCalled)
    }

}

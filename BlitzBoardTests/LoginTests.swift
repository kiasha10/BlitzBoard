//  LoginTests.swift
//  BlitzBoardTests
//
//  Created by Kiasha Rangasamy on 2024/05/28.
//

import XCTest
@testable import BlitzBoard

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var mockDelegate: MockLoginViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        mockDelegate = MockLoginViewModelDelegate()
        viewModel = LoginViewModel(delegate: mockDelegate)
    }
    
    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testValidLogin() {
    
        let email = "kiasha@gmail.com"
        let password = "10062000"
        
        viewModel.authenticate(email: email, password: password)
        
        XCTAssertTrue(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertFalse(mockDelegate.showErrorCalled)
    }
    
    func testInvalidLogin() {
        
        let email = "invalid@gmail.com"
        let password = "invalidpassword"
        
        viewModel.authenticate(email: email, password: password)
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
    
    func testEmptyFields() {
        
        let email = ""
        let password = ""
        
        viewModel.authenticate(email: email, password: password)
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
    
    func testNilEmailAndPassword() {

        viewModel.authenticate(email: nil, password: nil)
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
    
    func testEmptyEmail() {

        let password = "password"
        
        viewModel.authenticate(email: "", password: password)
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
    
    func testEmptyPassword() {

        let email = "email@gmail.com"
        
        viewModel.authenticate(email: email, password: "")
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
    
    func testInvalidEmailAndPassword() {

        let email = "invalidemail"
        let password = "invalidpassword"
        
        viewModel.authenticate(email: email, password: password)
        
        XCTAssertFalse(mockDelegate.navigateToHomeScreenCalled)
        XCTAssertTrue(mockDelegate.showErrorCalled)
    }
}

class MockLoginViewModelDelegate: LoginViewModelDelegate {
    
    var navigateToHomeScreenCalled = false
    var showErrorCalled = false
    var errorMessage: String?
    
    func navigateToHomeScreen() {
        navigateToHomeScreenCalled = true
    }
    
    func showError(message: String) {
        showErrorCalled = true
        errorMessage = message
    }
}

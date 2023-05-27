//
//  UINavigationControllerSpy.swift
//  MTMDesafioTests
//
//  Created by Jose Malengo on 21/05/23.
//

import UIKit

class UINavigationControllerSpy: UINavigationController {
    
    var wasPushViewControllerCalled = false
    var pushViewControllerCompletionHandler: ((_ viewcontroller: UIViewController, _ animated: Bool) -> Void)?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        wasPushViewControllerCalled = true
        pushViewControllerCompletionHandler?(viewController, animated)
    }
}


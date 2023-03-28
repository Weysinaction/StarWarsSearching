//
//  MainScreenModule.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

final class MainScreenModule {
    //MARK: - Public methods
    public static func build() -> UIViewController {
        let viewController = MainScreenViewController()
        let networkManager = NetworkManager()
        let presenter = MainScreenPresenter(networkManager: networkManager)
        let models = [Entity]()
        
        viewController.presenter = presenter
        presenter.models = models
        presenter.viewController = viewController
        
        return viewController
    }
}

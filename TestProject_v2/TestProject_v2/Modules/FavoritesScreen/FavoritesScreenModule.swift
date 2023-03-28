//
//  FavoritesScreenModule.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

final class FavoritesScreenModule {
    //MARK: - Public methods
    public static func build() -> UIViewController {
        let viewController = FavoritesScreenViewController()
        let presenter = FavoritesPresenter()
        let model = FavoritesModel.shared
        
        viewController.presenter = presenter
        presenter.model = model
        presenter.viewController = viewController
        
        return viewController
    }
}

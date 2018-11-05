//
//  MainCoordinator.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

class MainCoordinator {
    
    private weak var rootController: RootController!
    private weak var navigationController: UINavigationController?
    
    init(rootController: RootController) {
        self.rootController = rootController
    }
    
    func start() {
        initialScreen()
    }
    
    private func initialScreen() {
        let vc = InitialScreenViewController()
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [vc]
        rootController.presentViewController(viewController: navigationController, presentationTransition: .fade)
        self.navigationController = navigationController
    }
}

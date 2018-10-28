//
//  RootController.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

enum PresentationTransition {
    case pushRight, pushLeft, pushUp, pushDown, fade
}

class RootController: UIViewController {
    
    var rootViewController: UIViewController?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
    private func setRootViewController(viewController: UIViewController) {
        self.addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        rootViewController = viewController
    }
    
    /*
     This is used to when a RootController is presenting another viewController,
     In this case change viewController behind presentedViewController non-animated
     And dismiss presentViewController animated
    */
    private func presentViewControllerWhileDismissPresented(viewController toViewController: UIViewController) {
        guard let fromViewController = rootViewController else { return }
        self.rootViewController?.dismiss(animated: true)
        self.addChild(toViewController)
        toViewController.view.frame = view.bounds
        view.addSubview(toViewController.view)
        fromViewController.view.removeFromSuperview()
        fromViewController.removeFromParent()
        toViewController.didMove(toParent: self)
        rootViewController = toViewController
    }

    // MARK: - Public
    func presentViewController(viewController toViewController: UIViewController, presentationTransition transition: PresentationTransition, above: Bool = true) {
        guard let fromViewController = rootViewController else {
            setRootViewController(viewController: toViewController)
            return
        }
        guard presentedViewController == nil else {
            presentViewControllerWhileDismissPresented(viewController: toViewController)
            return
        }
        
        fromViewController.willMove(toParent: nil)
        addChild(toViewController)

        toViewController.view.frame = view.bounds
        prepareForTransition(fromViewController: fromViewController,
                             toViewController: toViewController,
                             presentationTransition: transition,
                             above: above)
        if above {
            view.addSubview(toViewController.view)
        } else {
            view.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        }

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveEaseInOut],
                       animations: {
                            self.animationsForTransition(fromViewController: fromViewController,
                                                         toViewController: toViewController,
                                                         presentationTransition: transition,
                                                         above: above)

        },
                       completion: { finish in
                            fromViewController.view.removeFromSuperview()
                        fromViewController.removeFromParent()
                        toViewController.didMove(toParent: self)
                            self.rootViewController = toViewController
        })
    }
    
    // MARK: - Animations
    private func prepareForTransition(fromViewController: UIViewController,
                                      toViewController: UIViewController,
                                      presentationTransition: PresentationTransition,
                                      above: Bool = true) {
        let muliplier: CGFloat = above ? 1.0 : 0.5
        
        switch presentationTransition {
        case .fade:
            toViewController.view.layer.opacity = 0.0
        case .pushUp:
            toViewController.view.top = view.height * muliplier
        case .pushDown:
            toViewController.view.top = -view.height * muliplier
        case .pushLeft:
            toViewController.view.left = view.width * muliplier
        case .pushRight:
            toViewController.view.left = -view.width * muliplier
        }
    }
    
    private func animationsForTransition(fromViewController: UIViewController,
                                         toViewController: UIViewController,
                                         presentationTransition: PresentationTransition,
                                         above: Bool = true) {
        let muliplier: CGFloat = above ? 0.5 : 1.0
        switch presentationTransition {
        case .fade:
            fromViewController.view.layer.opacity = 0.0
            toViewController.view.layer.opacity = 1.0
        case .pushUp:
            toViewController.view.top = 0
            fromViewController.view.top = -view.height * muliplier
        case .pushDown:
            toViewController.view.top = 0
            fromViewController.view.top = view.height * muliplier
        case .pushLeft:
            toViewController.view.left = 0
            fromViewController.view.left = -view.width * muliplier
        case .pushRight:
            toViewController.view.left = 0
            fromViewController.view.left = view.width * muliplier
        }
    }
}

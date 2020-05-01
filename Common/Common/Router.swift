//
//  Titles.swift
//  Common
//
//  Created by Elgendy on 30.04.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import UIKit

public typealias NavigationBackHandler = (() -> ())

public protocol RouterProtocol: class {
    func push(_ viewController: UIViewController?, onNavigateBack: NavigationBackHandler?)
    func pop()
    func popToRoot(animated: Bool)
    
    func present(_ viewController: UIViewController?)
    func swapStack(with controller: UIViewController, animated: Bool)
    func dismiss()
    
    func showNavigation(animated: Bool)
    func hideNavigation(animated: Bool)
}

public class Router: NSObject, RouterProtocol {
    
    public let navigationController: UINavigationController
    private var navigationBackHandlers: [String: NavigationBackHandler] = [:]
    
    public init(with navigation: UINavigationController) {
        self.navigationController = navigation
        super.init()
        self.navigationController.delegate = self
    }
    
    public func push(_ viewController: UIViewController?,
                     onNavigateBack handler: NavigationBackHandler?) {
        
        guard let viewController = viewController else { return }
        
        if let handler = handler {
            navigationBackHandlers.updateValue(handler, forKey: viewController.description)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func pop() {
        navigationController.popViewController(animated: true)
    }
    
    public func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    public func present(_ viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
    public func swapStack(with controller: UIViewController, animated: Bool) {
        navigationController.setViewControllers([controller], animated: animated)
    }
    
    public func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    public func showNavigation(animated: Bool) {
        navigationController.setNavigationBarHidden(false, animated: animated)
    }
    
    public func hideNavigation(animated: Bool) {
        navigationController.setNavigationBarHidden(true, animated: animated)
    }
    
    private func executeClosure(_ viewController: UIViewController) {
        guard let closure = navigationBackHandlers.removeValue(forKey: viewController.description) else { return }
        closure()
    }
    
}

extension Router: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(previousController) else { return }
        
        executeClosure(previousController)
    }
}

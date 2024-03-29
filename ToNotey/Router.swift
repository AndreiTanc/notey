//
//  Router.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import Foundation
import SwiftUI

enum RouterRoutes {
    case main
//    case todoFactory
    
    var view: any View {
        switch self {
        case .main:
            return MainView(viewModel: .init())
//        case .todoFactory:
//            return ToDoFactoryView()
        }
    }
}

final class Router {
    private var navigationController = UINavigationController()
    static var shared = Router()
    private init() {}
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func goToScreen(withRoute route: RouterRoutes) {
        pushViewController(instantiateScreen(withRoute: route))
    }
    
    func instantiateFirstScreen() -> UIViewController {
        navigationController = .init(rootViewController: instantiateScreen(withRoute: .main))
        return navigationController
    }
    
    private func instantiateScreen(withRoute route: RouterRoutes) -> UIViewController {
        UIHostingController(
            rootView: AnyView(
                route.view
            )
        )
    }
}

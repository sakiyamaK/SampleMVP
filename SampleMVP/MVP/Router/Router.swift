//
//  Router.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

final class Router {
    private var window: UIWindow!
    static let shared: Router = .init()
    private init() {}
    
    private var rootViewController: UIViewController {
        let vc = UIStoryboard(name: "GithubSearchMVP", bundle: nil).instantiateInitialViewController() as! GithubSearchMVPViewController
        let presenter = GithubSearchPresenter(output: vc)
        vc.inject(presenter: presenter)
        return vc
    }

    func showRoot(window: UIWindow) {
        self.window = window
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

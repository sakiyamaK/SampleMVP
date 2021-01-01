//
//  Router.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

final class Router {

  static private var rootViewController: UIViewController {
    let vc = UIStoryboard(name: "GithubSearchMVP", bundle: nil).instantiateInitialViewController() as! GithubSearchMVPViewController
    let presenter = GithubSearchPresenter(output: vc)
    vc.inject(presenter: presenter)
    return vc
  }

  static func showRoot(window: UIWindow) {
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
}

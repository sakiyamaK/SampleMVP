//
//  Router.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

final class Router {
  static func showGtihubSearch(now: UIViewController) {
    let vc = UIStoryboard(name: "GithubSearchMVP", bundle: nil).instantiateInitialViewController() as! GithubSearchMVPViewController
    let presenter = GithubSearchPresenter(output: vc)
    vc.inject(presenter: presenter)
    if let nav = now.navigationController {
      nav.pushViewController(vc, animated: true)
    } else {
      now.present(vc, animated: true, completion: nil)
    }
  }
}

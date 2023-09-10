//
//  AppDelegate.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

class TestGithubSearchPresenterOutput: GithubSearchPresenterOutput {
    func updateModels(_ models: [GithubModel]) {
        print(models)
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let vc = TestGithubSearchPresenterOutput()
//        let presenter = GithubSearchPresenter(output: vc)
//        presenter.searchText("swift", sortType: true)
//        presenter.searchText("android", sortType: true)
//        presenter.searchText("android", sortType: false)
//        presenter.searchText("", sortType: false)
//        presenter.searchText(nil, sortType: false)
//        self.presenter = presenter
//        self.vc = vc
        
        let window = UIWindow()
        self.window = window
        Router.showRoot(window: window)
        return true
    }
}

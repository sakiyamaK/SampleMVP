//
//  ViewController.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var button: UIButton! {
    didSet {
      button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
  }

  @objc func tapButton() {
    Router.showGtihubSearch(now: self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}


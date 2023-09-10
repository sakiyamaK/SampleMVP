//
//  MVPViewController.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import UIKit

final class GithubSearchMVPViewController: UIViewController {
    @IBOutlet private weak var sortTypeSegmentedControl: UISegmentedControl!

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "GithubTableViewCell", bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: GithubTableViewCell.description())
        }
    }
    
    private var presenter: GithubSearchPresenterInput!
    func inject(presenter: GithubSearchPresenterInput) {
        self.presenter = presenter
    }
}

extension GithubSearchMVPViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchText(searchBar.text, sortType: sortTypeSegmentedControl.isSelected)
    }
}

extension GithubSearchMVPViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(index: indexPath.row)
    }
}

extension GithubSearchMVPViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return presenter.numberOfModels
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTableViewCell.description(), for: indexPath) as! GithubTableViewCell
        let githubModel = presenter.githubModel(index: indexPath.row)!
        cell.configure(githubModel: githubModel)
        return cell
    }
}

extension GithubSearchMVPViewController: GithubSearchPresenterOutput {
    func updateModels(_: [GithubModel]) {
        tableView.reloadData()
    }
}

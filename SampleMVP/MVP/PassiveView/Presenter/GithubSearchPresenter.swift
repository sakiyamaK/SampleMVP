//
//  GithubSearchPresenter.swift
//  SampleMVP
//
//  Created by sakiyamaK on 2020/12/28.
//

import Foundation

//入力に関するprotocol
protocol GithubSearchPresenterInput {
  var numberOfModels: Int { get }
  func searchText(_ text: String, sortType: Bool)
  func didSelect(index: Int)
  func githubModel(index: Int) -> GithubModel?
}

//出力に関するprotocol
protocol GithubSearchPresenterOutput: AnyObject {
  func updateModels(_ models: [GithubModel])
}

//PresenterはInputとOutputのprotocolに準拠する
final class GithubSearchPresenter: GithubSearchPresenterInput {

  private weak var output: GithubSearchPresenterOutput!
  private var api: GithubAPIProtocol!
  private var models: [GithubModel]

  init(output: GithubSearchPresenterOutput, api: GithubAPIProtocol = GithubAPI.shared) {
    self.output = output
    self.api = api
    self.models = []
  }

  var numberOfModels: Int { models.count }

  func githubModel(index: Int) -> GithubModel? {
    guard index < models.count else { return nil }
    return models[index]
  }

  func didSelect(index: Int) {
    print(models[index])
  }

  func searchText(_ text: String, sortType: Bool) {
    self.api.get(searchWord: text, isDesc: sortType) {[weak self] (result) in
      switch result {
      case .success(let models):
        DispatchQueue.main.async {
          self?.models = models
          self?.output.updateModels(models)
        }
      case .failure(let error):
        break
      }
    }
  }
}

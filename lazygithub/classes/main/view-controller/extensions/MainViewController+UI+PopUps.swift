//
//  MainViewController+PopUps.swift
//

import AppKit

import lazyapi

var SortTypes: [String] = GitHubHTTPAPISearchRepositories.SortRepoType.allCases.compactMap({ $0.rawValue })

extension MainViewController {
  
  public func setupPopUpsLists() {

    sortPopUp.addItems(withTitles: SortTypes)
    sortPopUp.target = self
    sortPopUp.action = #selector(sortButtonAction(_:))
    sortPopUp.selectItem(withTitle: SortTypes.first!)
  }
}

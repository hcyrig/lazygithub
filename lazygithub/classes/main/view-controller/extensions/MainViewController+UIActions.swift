//
//  MainViewController+Actions.swift
//

import AppKit

import lazyapi

extension MainViewController {
  
  @IBAction func exportAction(_ sender: NSButton) {
    
    fetchDestinationFolderURLAction()
  }
  
  @objc public func sortButtonAction(_ sender: NSPopUpButton) {
    
    guard let sortType = GitHubHTTPAPISearchRepositories
      .SortRepoType(rawValue: sender.title) else { return }
    
    self.gitHubHTTPClient.context.sortType = sortType
  }
}

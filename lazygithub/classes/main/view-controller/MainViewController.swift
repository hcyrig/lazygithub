//
//  MainViewController.swift
//

import AppKit

import NOFoundation

import lazyapi

class MainViewController: BaseViewController {
  
  @IBOutlet weak var contentStackView: NSStackView!
  @IBOutlet weak var sortPopUp: NSPopUpButton!
  @IBOutlet weak var searchTextField: NSTextField!
  
  @IBOutlet private weak var exportButton: NSButton!
  
  var repos: [GitHubHTTPAPISearchRepositories.Repo] = []
  var gitHubHTTPClient: GitHubHTTPClient!
  
  override func setupInterface() {
    super.setupInterface()
    
    gitHubHTTPClient = GitHubHTTPClient(context: .init())
    
    searchTextField.delegate = self
    
    setupPopUpsLists()
    
    guard let sortType = GitHubHTTPAPISearchRepositories
      .SortRepoType(rawValue: SortTypes.first!) else { return }
    
    gitHubHTTPClient.context.sortType =  sortType
    
    gitHubHTTPClient.context.token = "YOUR_API_KEY"
  }
}

//
//  MainViewController+CSVActions.swift
//

import AppKit

extension MainViewController {
  
  public func fetchDestinationFolderURLAction() {
    
    NSOpenPanel
      .openDirectory(path: FileManager.homeDowndloadURL.absoluteString,
                     allowedMultipleSelection: false ) {[weak self] urls in
        
        guard let `self` = self else { return }
        
        guard !urls.isEmpty, let url = urls.first else { return }
        
        self.gitHubHTTPClient.context.destinationFolderURL = url
        
        self.searchReposAction(maxRequestedPages: 2, context: self.gitHubHTTPClient.context) {
          
          self.exportCSVAction()
        }
      }
  }
  
  func exportCSVAction() {
    
    let csv = CSV(models: self.repos)

    guard let destinationFolderURL = self.gitHubHTTPClient.context.destinationFolderURL else { return }

    csv.export(destinationFolderURL: destinationFolderURL,
               infix: "Seach Repos Pages \(self.gitHubHTTPClient.context.maxPage)")
  }
}

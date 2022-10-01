//
//  MainViewController+DiscordHTTPClient.swift
//

import AppKit

import NOFoundation

import lazyapi

extension MainViewController {
  
  public func searchReposAction(
    maxRequestedPages: Int,
    context: GitHubHTTPClient.Context,
    completion: @escaping VoidCallback) {
      
      self.gitHubHTTPClient.context.page = GitHubHTTPClient.Consts.firstPageNum
      self.gitHubHTTPClient.context.maxPage = maxRequestedPages
      
      self.repos = []
      
      DispatchQueue.global(qos: .background).async { [weak self] in
        
        guard let `self` = self else { return }
        
        self.fetchVacanciesAction(context: context,
                                  completion: {
          
          completion()
        })
      }
    }
  
  public func fetchVacanciesAction(
    context: GitHubHTTPClient.Context,
    completion: @escaping VoidCallback) {
    
    self.gitHubHTTPClient.getData(context: context) { [weak self] response in
    
      guard let `self` = self else { return }
      
      let repos = response.items
      
      context.page += 1
      
      self.repos.append(contentsOf: repos)
      
      if !repos.isEmpty && !context.isLastPage {
        
        self.fetchVacanciesAction(context: context,
                                  completion: completion)
        
      } else {
        
        completion()
      }
    }
  }
}

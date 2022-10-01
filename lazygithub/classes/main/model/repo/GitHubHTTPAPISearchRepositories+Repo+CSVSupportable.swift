//
//  GitHubHTTPAPISearchRepositories+Repo+CSVSupportable.swift
//

import Foundation

import lazyapi

// MARK: - CSVSupportable -

extension GitHubHTTPAPISearchRepositories.Repo: CSVSupportable {
  
  public static var csvKeys: String {
    
    return "id, name, url, stars, description\n"
  }
  
  public var csvLine: String {
    
    return "\(replaceSpecial(String(id))), \(replaceSpecial(name)), \(replaceSpecial(htmlURL)), \(replaceSpecial(String(stars))), \(replaceSpecial(description))\n"
  }
  
  public func replaceSpecial(_ string: String?) -> String {
    
    guard var string = string else { return .empty }
    
    string = string.replacingOccurrences(of: ",", with: " | ")
    string = string.replacingOccurrences(of: ";", with: " | ")
    return string
  }
}

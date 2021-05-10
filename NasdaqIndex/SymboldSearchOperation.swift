//
//  SymboldSearchOperation.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/9/21.
//  
//
//  renchiliu.com
//  https://github.com/RENCHILIU
//  Linkedin: Renchi Liu


import Foundation

class SymboldSearchOperation: Operation {
  var query: String
  var limit: Int
  
  init(query: String, limit: Int) {
    self.query = query
    self.limit = limit
  }
  
  override func execute() {
    WebServiceManager.invokeService(with: WebServiceRequest<[Company]>(.searchNasdaq(query: query, limit: limit)), completionHandler: { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let data):
        print(data)
      }
    })
  }
}

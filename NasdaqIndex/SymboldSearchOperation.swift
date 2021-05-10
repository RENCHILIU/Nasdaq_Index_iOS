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
  private var query: String
  private var limit: Int
  
  var companyList = [Company]()
  
  init(query: String, limit: Int) {
    self.query = query
    self.limit = limit
  }
  
  override func execute() {
    WebServiceManager.invokeService(with: WebServiceRequest<[Company]>(.searchNasdaq(query: query, limit: limit)), completionHandler: { [weak self] result in
      switch result {
      case .failure(let error):
        print(error)
//        finish(error)
      case .success(let data):
        self?.companyList = data
        print(data)
        self?.finish() // we need to call finish, otherwise it never ends
      }
    })
    
    
  }
}

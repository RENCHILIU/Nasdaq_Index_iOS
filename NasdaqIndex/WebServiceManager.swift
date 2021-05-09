//
//  WebServiceManager.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/8/21.
//  
//
//  renchiliu.com
//  https://github.com/RENCHILIU
//  Linkedin: Renchi Liu


import Foundation

enum Result<Data, Error> {
  case success(Data)
  case failure(Error)
}

typealias CompletionHandler = (Result<Data, Error>) -> Void
class WebServiceManager {
  
  static func invokeService(with request: WebServiceRequest, completionHandler: CompletionHandler?) {
    
    let networkOperation = URLSessionTaskOperation(task: URLSession.shared.dataTask(with: request.build(), completionHandler: { (data, response, error) in
      if let error = error {
        completionHandler?(Result.failure(error))
      } else if let data = data {
        completionHandler?(Result.success(data))
      } else {
        //TODO: handle error
      }
    }))
    let queue = OperationQueue()
    //TODO: how to maintain a singleton queue
    queue.addOperation(networkOperation)
  }
}

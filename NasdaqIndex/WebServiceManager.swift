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

enum Result<T, U> {
  case success(T)
  case failure(U)
}

//typealias CompletionHandler = (Result<CBData, Error>) -> Void

class WebServiceManager {
  
  static func invokeService<T: Decodable>(with request: WebServiceRequest<T>, completionHandler: ((Result<T, Error>) -> Void)?) {
    
    let networkOperation = URLSessionTaskOperation(task: URLSession.shared.dataTask(with: request.build(), completionHandler: { (data, response, error)  in
      if let error = error {
        completionHandler?(Result.failure(error))
      } else if let data = data {
        if let object = try? JSONDecoder().decode(T.self, from: data) {
          completionHandler?(Result.success(object))
        } else {
          //TODO: handle error
          print("decode error")
        }
      }else {
        //TODO: handle error
      }
    }))
    let queue = OperationQueue()
    //TODO: how to maintain a singleton queue
    queue.addOperation(networkOperation)
  }
}

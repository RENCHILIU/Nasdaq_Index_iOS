//
//  WebServiceRequest.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/8/21.
//  
//
//  renchiliu.com
//  https://github.com/RENCHILIU
//  Linkedin: Renchi Liu


import Foundation

let localhost = "http://localhost:8080/company"

enum HttpMethod: String {
  case GET
}

enum WebServiceRequestType {
  case searchNasdaq(query: String, limit: Int)

}

struct WebServiceRequest<T> {
  
  private var request: URLRequest?
  
  init(_ requestType: WebServiceRequestType) {
    switch requestType {
    case WebServiceRequestType.searchNasdaq(let query, let limit):
      request = buildRequest(url: "\(localhost)/search?query=\(query)&limit=\(limit)", method: .GET) //TODO:make it handle list
    }
  }
  
  //TODO: factory method for request
//  func addQuery(dict: [Any: Any]) {
//
//  }
  
  
  
  private func buildRequest(url: String, method: HttpMethod) -> URLRequest {
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = method.rawValue
    return request
  }
  
  func build() -> URLRequest {
    guard let request = request else { fatalError() } //TODO: handle error
    return request
  }
}

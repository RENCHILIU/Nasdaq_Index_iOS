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
  case searchNasdaq

}


struct WebServiceRequest {
  
  private var request: URLRequest?
  
  init(_ requestType: WebServiceRequestType) {
    switch requestType {
    case WebServiceRequestType.searchNasdaq:
      request = buildRequest(url: "\(localhost)/search?query=APP&limit=1", method: .GET)
    }
  }
  
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

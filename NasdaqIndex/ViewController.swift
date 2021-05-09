//
//  ViewController.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/8/21.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    WebServiceManager.invokeService(with: WebServiceRequest(.searchNasdaq)) { (result) in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let data):
        print(data)
      }
    }
  }


}

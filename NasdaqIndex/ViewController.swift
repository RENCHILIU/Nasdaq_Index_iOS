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
    
    let op = SymboldSearchOperation(query: "A", limit: 5)
    let queue = OperationQueue()
    //TODO: how to maintain a singleton queue
    queue.addOperation(op)
  }

 
}

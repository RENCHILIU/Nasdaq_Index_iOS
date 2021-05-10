//
//  ViewController.swift
//  NasdaqIndex
//
//  Created by liurenchi on 5/8/21.
//

import UIKit

//MARK: - Life Cycle
class ViewController: UIViewController {
  
  var companyList = [Company]()
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Search ++ "
  }

}

//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    let op = SymboldSearchOperation(query: searchText, limit: 5)
    let queue = OperationQueue()
    //TODO: how to maintain a singleton queue
    queue.addOperation(op)
    
    
    let op2 = BlockOperation {
      self.companyList = op.companyList
      self.tableView.reloadData()
    }
    
    op2.addDependency(op)
    queue.addOperation(op2)
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print("ButtonClicked")
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    print("cancel")
    //TODO: handle cancel
  }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return companyList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = companyList[indexPath.row].symbol
    return cell
  }
}

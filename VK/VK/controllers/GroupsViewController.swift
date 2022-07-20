//
//  GroupsViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 02.06.2022.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var groups = [Group]()
    let tableViewCellReuseIdentifier = "tableViewCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: tableViewCellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didAddGroup), name: Notification.Name("pressToAddGroup"), object: nil)
    }
    
    @objc func didAddGroup (_ notification: Notification) {
        guard let group = notification.object as? Group else {return}
        
        if !groups.contains(where: { groupItem in
                            groupItem.name == group.name
        }) {
            groups.append(group)
            tableView.reloadData()
        }
    }
    

}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellReuseIdentifier, for: indexPath) as! TableViewCell
        cell.configure(self.groups[indexPath.row])
        
        return cell
    }

}

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
     
    }
    
    
}

   

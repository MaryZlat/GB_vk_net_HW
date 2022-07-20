//
//  GroupCollectionViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 02.06.2022.
//

import UIKit

struct Group {
    var name: String
    var description: String?
    var avatar: String
}

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    func filldata() -> [Group] {
        let group1 = Group(name: "ABC club", description: "alphabet", avatar: "abc")
        let group2 = Group(name: "CaliRoll", avatar: "caliRoll")
        let group3 = Group(name: "LA dance", description: "", avatar: "LaDanse")
        
        var groups = [Group]()
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        
        return groups
    }
    
    var groups = [Group]()
    let tableViewCellReuseIdentifier = "tableViewCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = filldata()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: tableViewCellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    

}

extension AllGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellReuseIdentifier, for: indexPath) as! TableViewCell
        cell.configure(self.groups[indexPath.row])
        
        return cell
    }

}

extension AllGroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let group = groups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("pressToAddGroup"), object: group)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

//
//  FriendsViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 02.06.2022.
//

import UIKit

struct MyFriend {
    var name: String
    var age: String?
    var profilePicture: String
    var photoAlbum = [String]()
}

class FriendsViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let tableViewCellReuseIdetifier = "tableViewCellReuseIdetifier"
    let fromFriendsToAlbumSegue = "fromFriendsToAlbum"
    
    func fillData() -> [MyFriend] {
        let friend1 = MyFriend(name: "Hank Moody", age: "40", profilePicture: "hank", photoAlbum: ["hank1", "hank2","hank3","hank4"])
        let friend2 = MyFriend(name: "Karen Beek", age: "40", profilePicture: "karen", photoAlbum: ["karen1","karen2"])
        let friend3 = MyFriend(name: "Rebecca Moody", age: "15", profilePicture: "rebecca", photoAlbum: ["rebecca1", "rebecca2"])
        let friend4 = MyFriend(name: "Charlie Runcle", age: "40", profilePicture: "charlie", photoAlbum: ["charlie1"])
        let friend5 = MyFriend(name: "Mia Lewis", age: "17", profilePicture: "Mia", photoAlbum: ["mia1"])
        
        var friendsArray = [MyFriend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
        
        return friendsArray
    }
    
    var myFriends = [MyFriend]()
    var myFriendsCopy = [MyFriend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriends = fillData()
        myFriendsCopy = myFriends
        
        friendsTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: tableViewCellReuseIdetifier)
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        searchBar.delegate = self
        
    }
    
}

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = friendsTableView.dequeueReusableCell(withIdentifier: tableViewCellReuseIdetifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let friend = myFriends[indexPath.row]
//        cell.configureCell(image: UIImage(named: friend.profilePicture ?? "vk-logo1"), name: friend.name, description: friend.age)
        cell.configureCell(image: UIImage(named: friend.profilePicture)!,
                           name: friend.name,
                           description: friend.age,
                           shadow: true,
                           closure: { [weak self] in
                            guard let self = self else {return}
                            self.performSegue(withIdentifier: self.fromFriendsToAlbumSegue, sender: friend.photoAlbum)
                           })
        
        return cell
    }
    
    
}

extension FriendsViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == fromFriendsToAlbumSegue,
           let destinationController = segue.destination as? FriendCollectionViewController,
           let photos = sender as? [String] {
            destinationController.photoAlbum = photos
        }
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let photos = myFriends[indexPath.row].photoAlbum
//        performSegue(withIdentifier: fromFriendsToAlbumSegue, sender: indexPath.row)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }

}

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            myFriends = myFriendsCopy
        } else {
            myFriends = myFriendsCopy.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
            })
            friendsTableView.reloadData()
        }
    }
}

//
//  FriendCollectionViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 02.06.2022.
//

import UIKit

class FriendCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewCell = "CollectionViewCell"
    let collectionViewCellReuseIdentifier = "CollectionViewCellReuseIdentifier"
    var photoAlbum = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: collectionViewCell, bundle: nil), forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
}

extension FriendCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configure(image: UIImage(named: self.photoAlbum[indexPath.item]))
        
        return cell
    }
    
}

extension FriendCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        //добавление картинки на весь экран
        let fullscreenView = UIView(frame: self.view.bounds)
        let fullscreenImage = UIImageView(frame: fullscreenView.frame)
        fullscreenView.addSubview(fullscreenImage)
        fullscreenImage.image = UIImage(named: self.photoAlbum[indexPath.item])
        self.view.addSubview(fullscreenView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        fullscreenView.addGestureRecognizer(tap)
    }
    
    @objc func onTap(_ recognizer: UITapGestureRecognizer) {
        guard let targetView = recognizer.view else {return}
        targetView.removeFromSuperview()
    }

}

extension FriendCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let spacing: CGFloat = 20
        let cellWidth = width/3 - spacing
        
       return CGSize(width: cellWidth, height: cellWidth + 20)
    }
    
}

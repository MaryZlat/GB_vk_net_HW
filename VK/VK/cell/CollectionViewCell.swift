//
//  CollectionViewCell.swift
//  VK
//
//  Created by Mary Zlatnikova on 09.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func configure(image: UIImage?) {
        photoImageView.image = image
    }
    
}

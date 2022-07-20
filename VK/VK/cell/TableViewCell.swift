//
//  TableViewCell.swift
//  VK
//
//  Created by Mary Zlatnikova on 05.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
 
    @IBOutlet weak var profileShadowImageView: UIImageView!
    
    var closure: (()-> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profilePictureImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        profileShadowImageView.image = nil
        closure = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.height/2
        profilePictureImageView.clipsToBounds = true
        profilePictureImageView.layer.masksToBounds = true
        
    }
    
    func setUpShadow() {
        profileShadowImageView.layer.shadowColor = #colorLiteral(red: 0.2645098567, green: 0.4725040793, blue: 0.6696382165, alpha: 1).cgColor
        profileShadowImageView.layer.shadowOpacity = 0.6
        profileShadowImageView.layer.shadowRadius = 10
        profileShadowImageView.layer.shadowOffset = CGSize.zero
        profileShadowImageView.clipsToBounds = false
        profileShadowImageView.addSubview(profilePictureImageView)
    }
    
    
    
    func configureCell (image: UIImage?, name: String?, description: String?, shadow: Bool, closure: @escaping () -> Void) {
        profilePictureImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
        self.closure = closure
        if shadow == true {
            setUpShadow()
        }
    }
    
    func configure (_ group: Group) {
        profilePictureImageView.image = UIImage(named: group.avatar)
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }
    
    @IBAction func pressImageViewButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.profilePictureImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.profilePictureImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { [weak self] _ in
                self?.closure?()
                }
       }
    }
    
}

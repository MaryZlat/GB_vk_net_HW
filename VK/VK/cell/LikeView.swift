//
//  LikeView.swift
//  VK
//
//  Created by Mary Zlatnikova on 14.06.2022.
//

import UIKit

@IBDesignable class LikeView: UIView {

    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter = 0
    var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpXIB()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpXIB()
    }

    private func loadFromXIB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        
        return xibView
    }
    
    private func setUpXIB() {
        let xibView = loadFromXIB()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(xibView)
        
        counterLabel.text = String(counter)
    }
    
   
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        isPressed = !isPressed
        
        if isPressed {
            counter += 1
            heartImageView.image = UIImage(systemName: "heart.fill")
        } else {
            counter -= 1
            heartImageView.image = UIImage(systemName: "heart")
        }
        counterLabel.text = String(counter)
    }
    

}

//
//  LaunchViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 01.07.2022.
//

import UIKit
//for launchscreen animation
class LaunchViewController: UIViewController {

    private let imageViewLoad: UIImageView = {
        let imageViewLoad = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageViewLoad.image = UIImage(named: "vk-logo1")
        return imageViewLoad
    }()
    
    let toLoginViewController = "toLoginVCSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewLoad)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageViewLoad.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animateLaunch()
        }
    }
    
    private func animateLaunch() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width*3
            let differenceInX = size - self.view.frame.size.width
            let differenceInY = self.view.frame.size.height - size
            
            self.imageViewLoad.frame = CGRect(
                x: -(differenceInX/2),
                y: differenceInY/2,
                width: size,
                height: size
            )
        }
        UIView.animate(withDuration: 1.5) {
            self.imageViewLoad.alpha = 0
        } completion: { [weak self] done in
            guard let self = self else {return}
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.performSegue(withIdentifier: self.toLoginViewController, sender: nil)
                }
            }
        }

    }
}

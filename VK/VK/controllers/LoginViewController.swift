//
//  ViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 26.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var loginLable: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var myScrollView: UIScrollView!
   
    @IBOutlet weak var loadView1: UIView!
    @IBOutlet weak var loadView2: UIView!
    @IBOutlet weak var loadView3: UIView!
    
    let toTabBarController = "toTabBarController"
    
    func loadAnimate() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.loadView1.alpha = 1
            self?.loadView3.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.loadView1.alpha = 0
                self?.loadView2.alpha = 1
        }
           completion: { _ in
         UIView.animate(withDuration: 0.2) { [weak self] in
             self?.loadView2.alpha = 0
             self?.loadView3.alpha = 1
            }
            completion: { [weak self] _ in
                self?.loadAnimate()
            }
           }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(recognizer)
        
        loadView1.alpha = 0
        loadView1.layer.cornerRadius = loadView1.bounds.height/2
        loadView2.alpha = 0
        loadView2.layer.cornerRadius = loadView2.bounds.height/2
        loadView3.alpha = 0
        loadView3.layer.cornerRadius = loadView3.bounds.height/2
    }
 
    
    @objc func onTap (_ sender: Any) {
        if let sender = sender as? UITapGestureRecognizer {
            self.view.endEditing(true)
        }
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if let password = passwordTextField.text, password == "qwerty" {
            
            loadAnimate()
            
            UIView.animate(withDuration: 2) { [weak self] in
                self?.loginLable.transform = CGAffineTransform(translationX: 1000, y: 0)
                self?.loginTextField.transform = CGAffineTransform(translationX: 1000, y: 0)
            } completion: { _ in
                UIView.animate(withDuration: 2) { [weak self] in
                    self?.passwordTextField.backgroundColor = UIColor.systemGreen
                    self?.passwordLabel.transform = CGAffineTransform(translationX: -1000, y: 0)
                        self?.passwordTextField.transform = CGAffineTransform(translationX: -1000, y: 0)
                } completion: { [weak self] _ in
                    guard let self = self else {return}
                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    self.performSegue(withIdentifier: self.toTabBarController, sender: nil)
                    }
                }
            }

            
//            let animateTrailing = CABasicAnimation.init(keyPath: "position.x")
//            animateTrailing.toValue = 1000
//            animateTrailing.duration = 2
//            animateTrailing.beginTime = CACurrentMediaTime() + 0.2
//            loginLable.layer.add(animateTrailing, forKey: nil)
//            loginTextField.layer.add(animateTrailing, forKey: nil)
//
//            UIView.animate(withDuration: 2) { [weak self] in
//                let animateLeading = CABasicAnimation.init(keyPath: "position.x")
//                animateLeading.toValue = -1000
//                animateLeading.beginTime = CACurrentMediaTime() + 1
//                self?.passwordLabel.layer.add(animateLeading, forKey: nil)
//                self?.passwordTextField.layer.add(animateLeading, forKey: nil)
//            } completion: { [weak self] done in
//                guard let self = self else {return}
//                if done {
//                    self.passwordTextField.backgroundColor = UIColor.systemGreen
//                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//                        self.performSegue(withIdentifier: self.toTabBarController, sender: nil)
//                    }
//                }
//            }
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
        
    }
    
}


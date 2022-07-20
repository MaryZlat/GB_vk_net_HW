//
//  WebTestViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 19.07.2022.
//

import UIKit

class WebTestViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        WebRequest().friendsGetRequest()
        WebRequest().userPhotosGetRequest()
        WebRequest().userGroupsGetRequest()
        WebRequest().groupSearchGetRequest(text: "dog")
        
    }
    
}

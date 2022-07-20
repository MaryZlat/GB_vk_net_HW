//
//  friendsRequest.swift
//  VK
//
//  Created by Mary Zlatnikova on 19.07.2022.
//

import Foundation

class WebRequest {
    func friendsGetRequest() {
        var urlComponents = URLComponents(string: "https://api.vk.com/method/friends.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.userToken),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "fields", value: "city"),
        ]
        
        guard let url = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("response friends --> \(response)")
            print("error friends --> \(error)")
            
            guard let data = data else { return }
            print("body friends --> \(String(data: data, encoding: .utf8))")
            
        }.resume()
        
    }

    func userPhotosGetRequest() {
        var urlComponents = URLComponents(string: "https://api.vk.com/method/photos.getAll")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.userToken),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("response photos --> \(response)")
            print("error photos --> \(error)")
            
            guard let data = data else { return }
            print("body photos --> \(String(data: data, encoding: .utf8))")
            
        }.resume()
        
    }
    
    func userGroupsGetRequest() {
        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.userToken),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "true")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("response groups --> \(response)")
            print("error groups --> \(error)")
            
            guard let data = data else { return }
            print("body groups --> \(String(data: data, encoding: .utf8))")
            
        }.resume()
        
    }
    
    func groupSearchGetRequest(text: String) {
        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.userToken),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "q", value: text)
        ]
        
        guard let url = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("response group search --> \(response)")
            print("error group search --> \(error)")
            
            guard let data = data else { return }
            print("body group search --> \(String(data: data, encoding: .utf8))")
            
        }.resume()
        
    }
    
}

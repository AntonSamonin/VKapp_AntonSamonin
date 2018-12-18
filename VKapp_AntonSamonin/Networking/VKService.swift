//
//  VKService.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 11/6/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class VKService {
    
    let baseUrl = "https://api.vk.com"
    
    func loadUserGroupsAlamofire(completion: (([Group]?, Error?) -> Void)?  = nil) {
        
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "extended": "1",
            "count": "100",// Полная информация о группах
            "v": "5.87",
        ]
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case.failure(let error):
                completion?(nil,error)
            case.success(let value):
                let json = JSON(value)
                let myGroups = json["response"]["items"].arrayValue.map{return Group(json: $0)}
                completion?(myGroups,nil)
//                print(value)
            }
        }
    }
    
    
    func loadGroupsSearchAlamofire(searchText: String, completion: (([Group]?,Error?) -> Void)? = nil) {
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "q": searchText,
            "sort": "0",//сортировка по умолчанию
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case.failure(let error):
                completion?(nil,error)
            case.success(let value):
                let json = JSON(value)
                let searchGroups = json["response"]["items"].arrayValue.map {return Group(json: $0)}
                completion?(searchGroups, nil)
//                print(value)
            }
        }
    }
    
    func loadUserFriendsAlamofire(completion:(([User]?, Error?) -> Void)? = nil) {
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "order": "hints", // сортировка по рейтингу
            "fields": "photo_100",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case.failure(let error):
                completion?(nil,error)
            case.success(let value):
                let json = JSON(value)
              let friends = json["response"]["items"].arrayValue.map {return User(json: $0) }
                completion?(friends, nil)
               
                }
            }
        }
    
    func loadUserAllPhotosAlamofire(ownerID: Int, completion: (([Photo]?, Error?) -> Void)? = nil) {   //возвращает все фотографии пользователя
        let path = "/method/photos.getAll"
        let params: Parameters = [
            "access_token": Session.instance.token,
            "owner_id": ownerID, //индетификатор владельца фотографий
            "extended": "0",
            "v": "5.87",
            "count": "10"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case.failure(let error):
                completion?(nil,error)
            case.success(let value):
                let json = JSON(value)
                let photos = json["response"]["items"].arrayValue.map {return Photo(json: $0)}
                completion?(photos,nil)
            }
        }
    }
    
    func loadNewsFeed(completion:(([NewsPost]?, Error?) -> Void)? = nil) {
        let path = "/method/newsfeed.get"
        let params: Parameters = [
            "access_token": Session.instance.token,
            "filters": "post,photo", // сортировка по рейтингу
            "source_ids": "<uid>,-<gid>",
            "v": "5.87"
        ]
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            (response) in
            switch response.result {
            case.failure(let error):
                completion?(nil,error)
            case.success(let value):
                let json = JSON(value)
                let newsfeed = json["response"]["items"].arrayValue.map {return NewsPost(json: $0)}
                completion?(newsfeed,nil)
            }
        }
    }
    
    
    static func urlForAvatar(_ photo: String) -> URL? {
        return URL(string: photo)
    }
    
}

//
//  News.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/19/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import SwiftyJSON

class Post {
    
    var sourceId: Int
    var postDate: Double
    var type: String
    var postText: String?
    var likes: Int?
    var reposts: Int?
    var comments: Int?
    var photos: Array<PostPhoto>?
    var attachments: Array<AttachmentItem>?

    init(json: JSON) {
        self.type = json["type"].stringValue
        self.postDate = json["date"].doubleValue
        self.sourceId = json["source_id"].intValue
        self.postText = json["text"].stringValue
        self.likes = json["likes"]["count"].intValue
        self.reposts = json["reposts"]["count"].intValue
        self.comments = json["comments"]["count"].intValue
        self.photos = json["photos"]["items"].arrayValue.map{PostPhoto(json: $0)}
        self.attachments = json["attachments"].arrayValue.map{AttachmentItem(json: $0)}
    }
}



//{
//    "type": "photo",
//    "source_id": -47254649,
//    "date": 1545908505,
//    "photos": {
//        "count": 3,
//        "items": [
//        {
//        "id": 456248398,
//        "album_id": 251653495,
//        "owner_id": -47254649,
//        "user_id": 100,
//        "photo_75": "https://pp.userapi.com/c846416/v846416247/158df3/hk7cZfwW7fU.jpg",
//        "photo_130": "https://pp.userapi.com/c846416/v846416247/158df4/aULqHqL41Q4.jpg",
//        "photo_604": "https://pp.userapi.com/c846416/v846416247/158df5/avR7l3_RC-A.jpg",
//        "photo_807": "https://pp.userapi.com/c846416/v846416247/158df6/_POtzwzdypU.jpg",
//        "photo_1280": "https://pp.userapi.com/c846416/v846416247/158df7/L_eAldwyRqo.jpg",
//        "photo_2560": "https://pp.userapi.com/c846416/v846416247/158df8/lxwYMvg6Irk.jpg",
//        "width": 1440,
//        "height": 2160,
//        "text": "",
//        "date": 1545908505,
//        "access_key": "0e1f5ef88f77c09fe7",
//        "likes": {
//        "user_likes": 0,
//        "count": 2
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "comments": {
//        "count": 1
//        },
//        "can_comment": 1,
//        "can_repost": 1
//}

//{
//    "type": "post",
//    "source_id": -25557243,
//    "date": 1545912459,
//    "post_id": 3280363,
//    "post_type": "post",
//    "text": "Кинопоиск назвал список лучших фильмов 2018 года. \n \nИ в первую десятку вошли: \n1) Богемная рапсодия (8.185 из 10) \n2) Человек-паук: Через вселенные (8.169 из 10) \n3) Остров собак (8.135 из 10) \n4) Мстители: Война бесконечности (7.887 из 10) \n5) Экстаз (7.880 из 10) \n6) Укрась прощальное утро цветами обещания (7.876 из 10) \n7) Звезда родилась (7.576 из 10) \n8) Лето (7.474 из 10) \n9) Первому игроку приготовиться (7.424 из 10) \n10) Дэдпул 2 (7.415 из 10)",
//    "signer_id": 145066703,
//    "marked_as_ads": 0,




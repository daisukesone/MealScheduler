//
//  photo.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/03.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import RealmSwift

//アルバムのモデルクラス
class Album: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var date: NSDate!
    let photos = List<Photo>()
}

class Photo: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var picture: NSData!
    @objc dynamic var date: NSDate!
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

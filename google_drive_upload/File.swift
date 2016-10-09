//
//  File.swift
//  google_drive_upload
//
//  Created by 中村祐太 on 2016/10/09.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit
import RealmSwift

class File: Object {
    dynamic var name:String = ""
    dynamic var data:NSData? = nil
    dynamic var uploaded:Bool = false
}

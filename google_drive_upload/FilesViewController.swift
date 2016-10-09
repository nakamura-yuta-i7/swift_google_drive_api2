//
//  FilesViewController.swift
//  google_drive_upload
//
//  Created by 中村祐太 on 2016/10/09.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit
import RealmSwift

class FilesViewController: UIViewController {
    
    let api = GoogleDriveApi()
    
    @IBAction func uploadBtnTapped(_ sender: AnyObject) {
        
        let image = UIImage(named: "background.jpg")!
        let name = "テスト画像ファイル3.png"
        let mimeType = "image/png"
        let folderId = "0B0vk9XZ3993_dlhSSFlta3RqVEU"
        let serviceTicket = api.upload(image: image, name: name, mimeType: mimeType, folderId: folderId, callback: {
            print("★ complete drive upload.")
        })
        serviceTicket.uploadProgressBlock = {(ticket, written, total) in
            print("making progress percent: ", "\(written)/\(total)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        let realm = try! Realm()
//        
//        let file = File()
//        file.name = "テストファイル"
//        file.data = UIImagePNGRepresentation(UIImage(named: "tori.jpg")!)! as NSData?
//        
//        try! realm.write {
//            realm.add(file)
//        }
//        
//        let files = realm.objects(File.self)
//        print("realm.files::", files)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if ( !api.canAuth() ) {
            dismiss(animated: true, completion: nil)
        }
    }

}

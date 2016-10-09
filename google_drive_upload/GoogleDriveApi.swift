//
//  GoogleDriveApi.swift
//  google_drive_upload
//
//  Created by 中村祐太 on 2016/10/09.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit

import GTMOAuth2
import GoogleAPIClient

class GoogleDriveApi {
    fileprivate let kKeychainItemName = "Drive API keychain v2"
    fileprivate let kClientID = "577359574054-idbfg95lccqfkds8ouid5jf8ttm14c2p.apps.googleusercontent.com"
    fileprivate let service = GTLServiceDrive()
    
    func upload(image:UIImage, name:String, mimeType:String, folderId:String, callback: @escaping () -> Void ) -> GTLServiceTicket {
        
        let imageData = UIImagePNGRepresentation(image)! as NSData?
        
        let metaData:GTLDriveFile? = GTLDriveFile()
        metaData?.name = name
        metaData?.parents = [folderId]
        
        let uP = GTLUploadParameters(data: imageData as! Data, mimeType: mimeType)
        let query = GTLQueryDrive.queryForFilesCreate(withObject: metaData, uploadParameters: uP)
        let serviceTicket = service.executeQuery(query!, completionHandler: {(ticket, file, error) -> Void in
            callback()
        })
//        serviceTicket?.uploadProgressBlock = {(ticket, written, total) in
//            print("making progress, total: ", total)
//            print("making progress, written: ", written)
//        }
        return serviceTicket!
    }
    
    init() {
        setServiceAuth()
    }
    
    func setServiceAuth() {
        
        if let auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychain(
            forName: kKeychainItemName,
            clientID: kClientID,
            clientSecret: nil) {
            
            service.authorizer = auth
        }
    }
    
    func canAuth() -> Bool {
        let authorizer = service.authorizer
        let canAuth = authorizer?.canAuthorize
        return canAuth!
    }
}

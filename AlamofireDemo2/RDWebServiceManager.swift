//
//  RDWebServiceManager.swift
//  AlamofireDemo2
//
//  Created by Raghavendra Dattawad on 2/2/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RDWebServiceManager: NSObject {


    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {

  
        Alamofire.request(strURL).responseJSON {(responseObject) -> Void in


            print(responseObject)

            if responseObject.result.isSuccess {
                
                let resJson  = JSON(responseObject.result.value!)
                success(resJson)
                
                
            }

            if responseObject.result.isFailure {
                
                 let error :Error = responseObject.result.error!
                failure(error)
            }

}
}
 class func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){

    
    Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
        
        print(responseObject)
        
        if responseObject.result.isSuccess {
            let resJson = JSON(responseObject.result.value!)
            success(resJson)
        }
        if responseObject.result.isFailure {
            let error : Error = responseObject.result.error!
            failure(error)
        }
    }
    
}

  
    
    
}

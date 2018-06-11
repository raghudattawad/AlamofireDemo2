//
//  JsonFetchViewController.swift
//  AlamofireDemo2
//
//  Created by Raghavendra Dattawad on 2/2/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit

class JsonFetchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        let url = "http://demo0258162.mockable.io/SignUp"
        
        let dict = ["temptoken": "123456","mobnum":"9731976134"]
        
        print(dict)
       
        RDWebServiceManager.requestPOSTURL(url, params: dict as [String : AnyObject]?, headers: nil, success: { (json) in
            // success code
            print(json)
        }, failure: { (error) in
            //error code
            print(error)
        })

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

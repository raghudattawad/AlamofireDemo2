//
//  ViewController.swift
//  AlamofireDemo2
//
//  Created by Raghavendra Dattawad on 12/24/17.
//  Copyright © 2017 Raghavendra Dattawad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper


class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    var parseAllNames = [Name]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    getJSON()
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

func getJSON(){
        
        
Alamofire.request("http://api.androidhive.info/contacts").responseJSON {
        (response) -> Void in
    
    
    if response.result.isSuccess
    {
        let resJson = JSON(response.result.value!)
      
        
        
let getJsonNames =    ContactNames(JSONString:"\(resJson)")
        
    

       //let parseArray: ContactNames = Mapper().map(JSONString:"\( resJson)")!

        self.parseAllNames    =  (getJsonNames?.getNames!)!
        
        
        

       
        
 self.tableView.reloadData()
        
       
    }
    
    
    if response.result.isFailure {
        let error : NSError = response.result.error! as NSError
        print(error)
    }

}

    
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.parseAllNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = self.parseAllNames[indexPath.row].name
        
        return cell
        
    }


}

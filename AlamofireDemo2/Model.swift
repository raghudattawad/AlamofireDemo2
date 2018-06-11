//
//  Model.swift
//  
//
//  Created by Raghavendra Dattawad on 12/24/17.
//

import Foundation
import ObjectMapper


class ContactNames: Mappable {
    
    
    var getNames: [Name]?
    
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
       
    getNames <- map["contacts"]
    
        
    }
    
    
    
}

class Name: Mappable {
    
    
    var name:String?
    
    
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        
        name <- map["name"]
        
        
    }
    
    
    
}

//
//  GetNewsRequest.swift
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class GetNewsRequest: ITTAFNBaseDataRequest {
    
    override var parmaterEncoding:ITTParameterEncoding{
        set{
            super.parmaterEncoding = newValue;
        }get{
            return ITTJSONParameterEncoding;
        }
    }
    
    override func useDumpyData() -> Bool {
        return true;
    }
    
    override func dumpyResponseString() -> String! {
        
        return String(NSString(fileInMainBundle: "NewsJson", ofType: "json"));
    }
    
    override func getRequestMethod() -> ITTRequestMethod {
        return ITTRequestMethodGet;
    }

    override func getRequestUrl() -> String! {
        
        return DATA_ENV().urlRequestHost;
    }
    
    override func processResult() {
        
        super.processResult();
        
        let oldArray = self.handleredResult["data"] as! [AnyObject];
        let newArray = NSMutableArray();
        
        for dic in oldArray {
            let newModel = NewsModel(dataDic: dic as! [NSObject : AnyObject]);
            newArray.addObject(newModel);
        }
        
        self.handleredResult = newArray;
    }
    
}

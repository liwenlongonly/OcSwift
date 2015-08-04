//
//  NewsModel.swift
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import UIKit

class NewsModel: ITTBaseModelObject {
    
    override init!(dataDic data: [NSObject : AnyObject]!) {
        super.init(dataDic: data)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var title:String?;
    var desc:String?;
    override func attributeMapDictionary() -> [NSObject : AnyObject]! {
        return ["title":"name","desc":"desc"];
    }
    
}

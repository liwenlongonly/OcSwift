//
//  ITTCommonMacros.swift
//  OcSwift
//
//  Created by 李文龙 on 15/7/30.
//  Copyright © 2015年 李文龙. All rights reserved.
//

import Foundation

//MARK: - shortcuts
func USER_DEFAULT()->NSUserDefaults{
   return NSUserDefaults.standardUserDefaults();
}

func DATA_ENV()->ITTDataEnvironment{
    return ITTDataEnvironment.sharedDataEnvironment();
}

//MARK: - color functions
func RGBCOLOR(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
}

func RGBCOLOR(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0);
}

//
//  UIColor+KIAdditions.h
//  ECarWash
//
//  Created by 李文龙 on 15/1/4.
//  Copyright (c) 2015年 vjifen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ITTAdditions)
/**
 *  方法功能：通过字符串类型的16进制的颜色值(例如“＃FFFFFF”)生成颜色对象
 */
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;
/**
 *  方法功能：通过整形类型的16进制的颜色值和透明度alpha(例如＃FFFFFF)生成颜色对象
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
/**
 *  方法功能：通过整形类型的16进制的颜色值(例如＃FFFFFF)生成颜色对象
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
/**
 *  方法功能：通过颜色对象获取他的颜色值
 */
+ (NSString*)hexFromUIColor:(UIColor*)color;

@end

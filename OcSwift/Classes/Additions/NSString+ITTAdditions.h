//
//  NSString+ITTAdditions.h
//
//  Created by Jack on 11-9-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (ITTAdditions)

/**
 *  方法功能：判断字符串是否以start开头
 */
- (BOOL)isStartWithString:(NSString*)start;
/**
 *  方法功能：判断字符串是否以end结尾
 */
- (BOOL)isEndWithString:(NSString*)end;
/**
 *  方法功能：判断字符串中是否含有子字符串
 */
- (BOOL)isContainsString:(NSString*)subString;
/**
 *  方法功能：读取MainBundle文件中的字符串
 */
+ (NSString*)stringWithFileInMainBundle:(NSString*)fileName ofType:(NSString*)type;
/**
 *  方法功能：读取MainBundle文件中的字符串
 */
+ (NSString*)stringWithFileInMainBundle:(NSString*)relativePath;
/**
 *  方法功能：md5加密算法
 */
- (NSString*)md5;
/**
 *  方法功能：urlEncoded算法
 */
- (NSString*)urlEncodedString;
/**
 *  方法功能：urlDecoded算法
 */
- (NSString*)urlDecodedString;
/**
 *  方法功能：判断字符串是否是合法的url
 */
- (BOOL)isURL;
/**
 *  方法功能：
 */
+ (NSString *)stringFromRawObject:(id)obj;

- (NSInteger)numberOfLinesWithFont:(UIFont*)font withLineWidth:(NSInteger)lineWidth;

- (CGFloat)heightWithFont:(UIFont*)font withLineWidth:(NSInteger)lineWidth;

- (CGFloat)widthWithFont:(UIFont*)font;

/**
 *  方法功能：
 */

+ (NSData *)sha256HMacWithData:(NSData *)data withKey:(NSData *)key;

+ (NSString *)hexEncode:(NSString *)string;

@end


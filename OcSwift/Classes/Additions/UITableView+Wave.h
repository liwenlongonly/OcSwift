//
//  UITableView+Wave.h
//  ECarWash
//
//  Created by 李文龙 on 15/8/18.
//  Copyright (c) 2015年 vjifen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBOUNCE_DISTANCE  2

typedef NS_ENUM(NSInteger,WaveAnimation) {
    LeftToRightWaveAnimation = -1,
    RightToLeftWaveAnimation = 1
};

@interface UITableView (Wave)
/**
 *  方法功能：使用动画刷新
 */
- (void)reloadDataAnimateWithWave:(WaveAnimation)animation;
@end

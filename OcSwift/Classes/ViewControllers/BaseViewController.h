//
//  BaseViewController.h
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright © 2015年 李文龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    
}
@property(nonatomic,assign)BOOL isAnimationCell;
@property(nonatomic,weak)UITableView*tableViewRef;
/**
 *  在 NavigationBar上 创建 E洗车的 logo
 */
- (void)initNavigationBarView;
/**
 *  创建导航上的左边按钮
 */
- (UIButton *)createLeftItemAction:(SEL)selector;
/**
 *  创建导航栏的右侧按钮
 */
- (UIButton*)createRightItemAction:(SEL)selector;
/**
 *  创建导航栏的返回按钮
 */
- (UIButton*)goBackBtn;
/**
 * 这个方法需要子类Override，不能直接调用
 */
- (void)linkRef;
/**
 *  方法功能：返回按钮的点击事件
 */
- (void)onGoBack:(id)sender;
@end

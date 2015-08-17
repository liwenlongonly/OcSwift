//
//  BaseViewController.m
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright © 2015年 李文龙. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    NSInteger _currentIndex;
}
@end

@implementation BaseViewController
#pragma mark - Public Method
- (void)initNavigationBarView
{
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    UIImageView * logoImageView = [[UIImageView alloc]initWithImage:ImageNamed(@"logo")];
    logoImageView.center = CGPointMake(CGRectGetWidth(titleView.frame)/2.0f, CGRectGetHeight(titleView.frame)/2.0f);
    [titleView addSubview:logoImageView];
    self.navigationItem.titleView = titleView;
}

- (UIButton *)createLeftItemAction:(SEL)selector
{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    leftBtn.frame = CGRectMake(267, 2, 50, 40);
    leftBtn.adjustsImageWhenHighlighted = YES;
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    return leftBtn;
}

- (UIButton*)createRightItemAction:(SEL)selector
{
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    rightBtn.frame = CGRectMake(275, 2, 50, 40);
    [rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, -20)];
    rightBtn.adjustsImageWhenHighlighted = YES;
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    return rightBtn;
}

- (UIButton *)goBackBtn
{
    UIButton * leftBtn = [self createLeftItemAction:@selector(onGoBack:)];
    [leftBtn setImage:ImageNamed(@"back_img")forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(10, -10, 10, 40)];
    return leftBtn;
}

- (void)onGoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 * 这个方法需要子类Override，不能直接调用
 */
- (void)linkRef{
    
}

#pragma mark - Lifecycle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bounds = [[UIScreen mainScreen]bounds];
    //self.view.backgroundColor = [UIColor grayColor];
    [self linkRef];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (self.tableViewRef) {
        self.tableViewRef.backgroundColor = [UIColor clearColor];
        self.tableViewRef.backgroundView = nil;
        self.tableViewRef.tableFooterView = [[UIView alloc]init];
    }
}

-(void)viewDidLayoutSubviews
{
    if (self.tableViewRef&&[self.tableViewRef respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableViewRef setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    if (self.tableViewRef&&[self.tableViewRef respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableViewRef setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.tableViewRef) {
        return;
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
#endif
    if (_isAnimationCell) {
        
        if (tableView.contentOffset.y<0) {
            return;
        }
        NSInteger temp = _currentIndex-indexPath.row;
        if(temp<0){
            CATransform3D translation = CATransform3DMakeTranslation(0, 400, 0);
            CATransform3D scaleAndTranslation =CATransform3DScale(translation,0.5,0.5,1.0);
            //rotation.m34 = 1.0/ -600;
            
            //2. Define the initial state (Before the animation)
            cell.alpha = 0;
            cell.layer.transform = scaleAndTranslation;
        }
        [UIView animateWithDuration:0.30f animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
        }];
        _currentIndex = indexPath.row;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

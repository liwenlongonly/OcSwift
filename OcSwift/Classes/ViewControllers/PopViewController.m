//
//  PopViewController.m
//  OcSwift
//
//  Created by 李文龙 on 15/8/6.
//  Copyright © 2015年 李文龙. All rights reserved.
//

#import "PopViewController.h"
#import "POP.h"

@interface PopViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation PopViewController

#pragma mark - Private Method
- (void)initDatas
{
    
}

- (void)initViews
{
    _btn.layer.cornerRadius = 20;
}

#pragma mark - UIButton Event
- (IBAction)startBtnClick:(id)sender
{
    POPSpringAnimation * positionY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionY.dynamicsMass = 50.0;
    positionY.springSpeed = 10;
    positionY.springBounciness = 8;
    positionY.fromValue = @(0);
    positionY.toValue = @(300);
    [_btn.layer pop_addAnimation:positionY forKey:@"positionY"];
}

#pragma mark - Lifecycle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initDatas];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
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

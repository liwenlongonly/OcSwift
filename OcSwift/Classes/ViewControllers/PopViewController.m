//
//  PopViewController.m
//  OcSwift
//
//  Created by 李文龙 on 15/8/6.
//  Copyright © 2015年 李文龙. All rights reserved.
//

#import "PopViewController.h"
#import "POP.h"
#import "CurveBorderView.h"

@interface PopViewController ()
{
    BOOL _done;
}

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet CurveBorderView *curveView;

@end

@implementation PopViewController

#pragma mark - Private Method
- (void)initDatas
{
    _done = NO;
}

- (void)initViews
{
    _btn.layer.cornerRadius = 20;
    [_curveView  setCurveBorderType:kCurveBorderTypeCurve curveBorderDirection:kCurveBorderDirectionVertical];
    _curveView.fillColor = self.view.backgroundColor;
}

- (void)createThread
{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"liwenlong"];
    [thread setName:@"thread1"];
    [thread start];
}

- (void)run:(NSString*)name
{
    //此种方式创建的timer已经添加至runloop中
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    //保持线程为活动状态，才能保证定时器执行
    //[[NSRunLoop currentRunLoop] run];//已经将nstimer添加到NSRunloop中了
    NSLog(@"多线程结束");
    NSLog(@"%@ create  name:%@",[[NSThread currentThread]name],name);
}

- (void)timerAction{
    NSLog(@"定时器执行");
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
    positionY.completionBlock = ^(POPAnimation *anim, BOOL finished){
        
    };
    [_btn.layer pop_addAnimation:positionY forKey:@"positionY"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 创建3个操作
    NSOperation *a = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"operationA---");
        
    }];
    
    NSOperation *b = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"operationB---");
        
    }];
    
    NSOperation *c = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"operationC---");
        
    }];
    
    // 添加依赖
    
    [c addDependency:a];
    
    [c addDependency:b];
    
    // 执行操作
    
    [queue addOperation:c];
    
    [queue addOperation:a];
    
    [queue addOperation:b];
    

    [self createThread];
    
    NSLog(@"线程创建完成！");
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

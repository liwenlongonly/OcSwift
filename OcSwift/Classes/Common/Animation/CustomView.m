//
//  CustomView.m
//
//  Code generated using QuartzCode 1.21 on 15/8/21.
//  www.quartzcodeapp.com
//

#import "CustomView.h"
#import "QCMethod.h"


@interface CustomView ()

@property (nonatomic, strong) NSArray*  layerWithAnims;
@property (nonatomic, assign) BOOL animationAdded;

@property (nonatomic, strong) CAShapeLayer *oval;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupLayers];
	}
	return self;
}


- (void)setFrame:(CGRect)frame{
	[super setFrame:frame];
	[self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
	[super setBounds:bounds];
	[self setupLayerFrames];
}

- (void)setupLayers{
	CAShapeLayer * oval = [CAShapeLayer layer];
	[self.layer addSublayer:oval];
	oval.lineCap     = kCALineCapRound;
	oval.lineJoin    = kCALineJoinRound;
	oval.fillColor   = [UIColor whiteColor].CGColor;
	oval.strokeColor = [UIColor greenColor].CGColor;
	oval.lineWidth   = 5;
	_oval = oval;
	
	[self setupLayerFrames];
	
	self.layerWithAnims = @[oval];
}


- (void)setupLayerFrames{
	_oval.frame = CGRectMake(0.32397 * CGRectGetWidth(_oval.superlayer.bounds), 0.51471 * CGRectGetHeight(_oval.superlayer.bounds), 0.33193 * CGRectGetWidth(_oval.superlayer.bounds), 0.18654 * CGRectGetHeight(_oval.superlayer.bounds));
	_oval.path  = [self ovalPathWithBounds:_oval.bounds].CGPath;
}


- (IBAction)startAllAnimations:(id)sender{
	self.animationAdded = NO;
	for (CALayer *layer in self.layerWithAnims){
		layer.speed = 1;
	}
	[self.oval addAnimation:[self ovalAnimation] forKey:@"ovalAnimation"];
}

- (void)setProgress:(CGFloat)progress{
	if(!self.animationAdded){
		[self startAllAnimations:nil];
		self.animationAdded = YES;
		for (CALayer *layer in self.layerWithAnims){
			layer.speed = 0;
			layer.timeOffset = 0;
		}
	}
	else{
		CGFloat totalDuration = 1;
		CGFloat offset = progress * totalDuration;
		for (CALayer *layer in self.layerWithAnims){
			layer.timeOffset = offset;
		}
	}
}

- (CABasicAnimation*)ovalAnimation{
	CABasicAnimation * strokeStartAnim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
	strokeStartAnim.fromValue          = @1;
	strokeStartAnim.toValue            = @0;
	strokeStartAnim.duration           = 1;
	strokeStartAnim.fillMode = kCAFillModeForwards;
	strokeStartAnim.removedOnCompletion = NO;
	
	return strokeStartAnim;
}

#pragma mark - Bezier Path

- (UIBezierPath*)ovalPathWithBounds:(CGRect)bound{
	UIBezierPath *ovalPath = [UIBezierPath bezierPath];
	CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
	
	[ovalPath moveToPoint:CGPointMake(minX + 0.5 * w, minY)];
	[ovalPath addCurveToPoint:CGPointMake(minX, minY + 0.5 * h) controlPoint1:CGPointMake(minX + 0.22386 * w, minY) controlPoint2:CGPointMake(minX, minY + 0.22386 * h)];
	[ovalPath addCurveToPoint:CGPointMake(minX + 0.5 * w, minY + h) controlPoint1:CGPointMake(minX, minY + 0.77614 * h) controlPoint2:CGPointMake(minX + 0.22386 * w, minY + h)];
	[ovalPath addCurveToPoint:CGPointMake(minX + w, minY + 0.5 * h) controlPoint1:CGPointMake(minX + 0.77614 * w, minY + h) controlPoint2:CGPointMake(minX + w, minY + 0.77614 * h)];
	[ovalPath addCurveToPoint:CGPointMake(minX + 0.5 * w, minY) controlPoint1:CGPointMake(minX + w, minY + 0.22386 * h) controlPoint2:CGPointMake(minX + 0.77614 * w, minY)];
	
	return ovalPath;
}

@end
//
//  QMJoyStick.m
//  QMJoyStick
//
//  Created by metthew on 2016/10/13.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import "QMJoyStick.h"

@interface QMJoyStick()

@property (nonatomic, strong) UIImageView *stickBgView;

@property (nonatomic, strong) UIImageView *stickView;

@end

@implementation QMJoyStick

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self initView:frame];
    }
    return self;
}

- (void)initView:(CGRect)frame
{
    self.stickBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.stickBgView];
    [self.stickBgView.layer setMasksToBounds:YES];
    [self.stickBgView.layer setCornerRadius:frame.size.width/2];
    
    self.stickView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4, frame.size.height/4, frame.size.width/2, frame.size.height/2)];
    [self addSubview:self.stickView];
    
    self.stickView.image = [UIImage imageNamed:@"stick_normal"];
    self.stickBgView.backgroundColor = [UIColor greenColor];

}

- (void)callinelength:(CGPoint)point
{
    CGFloat centrex = self.frame.size.width/2;          //圆心X
    CGFloat centrey = self.frame.size.height/2;         //圆心Y
    CGFloat radius = self.frame.size.width/2;           //半径
    CGFloat x;              //坐标系X
    CGFloat y;              //坐标系Y
    
    x = point.x - centrex;
    y = centrey - point.y;
    //NSLog(@"x = %f   y = %f",x, y);
    
    float current_radius =  sqrtf(x*x + y*y);           //计算改点到圆心的距离
    if(current_radius > radius)
    {
        //NSLog(@"不在圆内");
        float circlex = fabs(x) / current_radius * radius;
        float circley = fabs(y) / current_radius * radius;
        if(x < 0 && y > 0)
        {
            x = centrex - circlex;
            y = centrey - circley;
        }
        else if(x > 0 && y > 0)
        {
            x = centrex + circlex;
            y = centrey - circley;
        }
        else if(x < 0 && y < 0)
        {
            x = centrex - circlex;
            y = centrey + circley;
        }
        else if (x > 0 && y < 0)
        {
            x = centrex + circlex;
            y = centrey + circley;
        }
        self.stickView.center = CGPointMake(x, y);
    }
    else
    {
        //NSLog(@"在圆内");
        self.stickView.center = CGPointMake(point.x, point.y);
        
    }
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pointBegan = [touch locationInView:self];
    [self callinelength:pointBegan];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pointBegan = [touch locationInView:self];
    [self callinelength:pointBegan];
}

//结束复位
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.stickView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}


@end

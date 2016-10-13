//
//  ViewController.m
//  QMJoyStick
//
//  Created by metthew on 2016/10/13.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import "ViewController.h"
#import "QMJoyStick.h"

@interface ViewController ()

@property (nonatomic, strong) QMJoyStick *joystick;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.joystick = [[QMJoyStick alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.joystick];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

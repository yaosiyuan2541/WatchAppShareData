//
//  ViewController.m
//  iOS25_Test_WatchKit
//
//  Created by 姚思远 on 16/4/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>
@interface ViewController ()<WCSessionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *mylabel;

@end

@implementation ViewController
- (IBAction)buttonClick:(id)sender {
    if ([WCSession isSupported]) {
        WCSession * session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        [session updateApplicationContext:@{@"name":@"sdfgj"} error:nil];
//        [session transferUserInfo:@{@"name":@"赵六"}];
//        [session transferUserInfo:@{@"name":@"张三"}];
//        [session transferUserInfo:@{@"name":@"李四"}];
//        [session transferUserInfo:@{@"name":@"王五"}];
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

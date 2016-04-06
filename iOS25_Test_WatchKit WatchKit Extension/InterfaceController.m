//
//  InterfaceController.m
//  iOS25_Test_WatchKit WatchKit Extension
//
//  Created by 姚思远 on 16/4/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>
@interface InterfaceController()<WCSessionDelegate>
{
    WCSession * session;
}

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *infoLabel;

@end


@implementation InterfaceController
//watchOS1中可以使用group进行设备之间的数据通信，但是在WatchOS2以后，watch已经不在是附属，而是一个独立的设备类似于两个独立的iPhone，所以需要使用新的方法进行通信
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

}
- (IBAction)getInfo {
    if ([WCSession isSupported]) {
        session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    /*将接收到的消息展示到刚刚准备好的label上*/
    [self.infoLabel setText:session.receivedApplicationContext[@"name"]];
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end




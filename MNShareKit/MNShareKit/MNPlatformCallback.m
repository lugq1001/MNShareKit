//
//  MNPlatformCallback.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatformCallback.h"


static MNPlatformCallback *callback = nil;

@implementation MNPlatformCallback

+ (MNPlatformCallback *)sharedInstance {
    static MNPlatformCallback *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^(void) {
        sharedSingleton = [MNPlatformCallback new];
    });
    return sharedSingleton;
}

#pragma mark - 微信
- (void)onReq:(BaseReq *)req {
    
}

- (void)onResp:(BaseResp *)resp {
    
}

#pragma mark - 新浪微博
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    
}

@end

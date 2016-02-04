//
//  MNPlatformCallback.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentApiInterface.h>

@interface MNPlatformCallback : NSObject <WXApiDelegate, WeiboSDKDelegate, TencentSessionDelegate>

+ (MNPlatformCallback *)sharedInstance;

@end

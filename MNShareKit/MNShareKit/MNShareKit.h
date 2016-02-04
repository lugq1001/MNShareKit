//
//  MNShareKit.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "MNPlatform.h"
#import "MNPlatformCallback.h"

#define MNDeviceWidth         [[UIScreen mainScreen] bounds].size.width
#define MNDeviceHeight        [[UIScreen mainScreen] bounds].size.height

#define WeChatAppID @"wx20ec458b2c5ab93b"

@protocol MNShareKitDelegate <NSObject>

- (void)shareKitDidPlatformSelected:(MNPlatform *)platform;

@end


@interface MNShareKit : NSObject

@property (nonatomic) id<MNShareKitDelegate> delegate;

- (instancetype)initWithPlatforms:(NSArray *)platforms delegate:(id<MNShareKitDelegate>) delegate;

- (void)showInView:(UIView *)view;

+ (void)weChatRegist;
+ (BOOL)weChatInstalled;

- (void)share:(NSString *)title
         desc:(NSString *)desc
    thumbnial:(UIImage *)thumbnial
          url:(NSString *)url
     platform:(MNPlatform *)platform;

@end

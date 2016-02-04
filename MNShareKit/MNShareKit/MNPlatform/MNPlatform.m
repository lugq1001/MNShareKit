//
//  MNPlatform.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatform.h"

@implementation MNPlatform

+ (instancetype)create:(MNPlatformType)type {
    return [[MNPlatform alloc] initWithPlatformType:type];
}

- (instancetype)initWithPlatformType:(MNPlatformType)type {
    if ([super init]) {
        _type = type;
        switch (type) {
            case MNPlatformTypeWeChatFriend:
                _name = @"微信好友";
                _icon = @"WeChat.png";
                break;
            case MNPlatformTypeWeChatTimeline:
                _name = @"微信朋友圈";
                _icon = @"WeChatTimeline.png";
                break;
            case MNPlatformTypeSinaWeibo:
                _name = @"新浪微博";
                _icon = @"SinaWeibo.png";
                break;
            case MNPlatformTypeQQFriend:
                _name = @"QQ好友";
                _icon = @"QQ.png";
                break;
            case MNPlatformTypeQQZone:
                _name = @"QQ空间";
                _icon = @"QQZone.png";
                break;
            default:
                break;
        }
        return self;
    }
    return nil;
}

@end

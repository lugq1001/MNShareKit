//
//  MNPlatform.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  分享平台
 */
typedef NS_ENUM(NSInteger, MNPlatformType) {
    /**
     *  微信朋友圈
     */
    MNPlatformTypeWeChatFriend,
    /**
     *  微信时间轴
     */
    MNPlatformTypeWeChatTimeline,
    /**
     *  新浪微博
     */
    MNPlatformTypeSinaWeibo,
    /**
     *  QQ好友
     */
    MNPlatformTypeQQFriend,
    /**
     *  QQ空间
     */
    MNPlatformTypeQQZone
};

@interface MNPlatform : NSObject

+ (instancetype)create:(MNPlatformType)type;
- (instancetype)initWithPlatformType:(MNPlatformType)type;

@property (nonatomic) MNPlatformType type;

@property (nonatomic) NSString *name;

@property (nonatomic) NSString *icon;

@end




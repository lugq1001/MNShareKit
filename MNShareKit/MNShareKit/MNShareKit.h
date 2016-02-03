//
//  MNShareKit.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

@import Foundation;


/**
 *  分享平台
 */
typedef NS_ENUM(NSInteger, MNShareKitPlatform) {
    /**
     *  微信朋友圈
     */
    MNShareKitPlatformWeChatFriend,
    /**
     *  微信时间轴
     */
    MNShareKitPlatformWeChatTimeline,
    /**
     *  新浪微博
     */
    MNShareKitPlatformSinaWeibo,
    /**
     *  QQ好友
     */
    MNShareKitPlatformQQFriend,
    /**
     *  QQ空间
     */
    MNShareKitPlatformQQZone
};


@interface MNShareKit : NSObject



@end

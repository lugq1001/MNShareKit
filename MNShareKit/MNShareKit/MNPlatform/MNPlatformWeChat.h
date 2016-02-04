//
//  MNPlatformWeChat.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatform.h"
@import UIKit;

@interface MNPlatformWeChat : MNPlatform


+ (void)shareToFriend:(NSString *)title
                 desc:(NSString *)desc
            thumbnail:(NSData *)thumbnail
         mediaTagName:(NSString *)mediaTagName
                  url:(NSString *)url;

+ (void)shareToTimeline:(NSString *)title
              thumbnail:(NSData *)thumbnail
           mediaTagName:(NSString *)mediaTagName
                    url:(NSString *)url;

@end

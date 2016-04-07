//
//  MNPlatformQQ.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNPlatformQQ : NSObject

+ (void)shareToQQ:(NSString *)title
          content:(NSString *)content
            image:(NSData *)image
        thumbnail:(NSData *)thumbnail
              url:(NSString *)url;

+ (void)shareToQZone:(NSString *)title
             content:(NSString *)content
               image:(NSData *)image
           thumbnail:(NSData *)thumbnail
                 url:(NSString *)url;

@end

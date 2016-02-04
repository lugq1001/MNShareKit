//
//  MNPlatformSinaWeibo.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNPlatformSinaWeibo : NSObject

+ (void)share:(NSString *)content
    imageData:(NSData *)imageData;

@end

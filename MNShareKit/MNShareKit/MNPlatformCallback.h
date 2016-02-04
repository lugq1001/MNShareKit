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

@interface MNPlatformCallback : NSObject <WXApiDelegate>

+ (MNPlatformCallback *)sharedInstance;

@end

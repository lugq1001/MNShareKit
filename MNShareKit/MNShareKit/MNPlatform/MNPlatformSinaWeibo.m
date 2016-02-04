//
//  MNPlatformSinaWeibo.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatformSinaWeibo.h"
#import "WeiboSDK.h"

@implementation MNPlatformSinaWeibo

+ (void)share:(NSString *)content
    imageData:(NSData *)imageData
{
    WBMessageObject *msg = [WBMessageObject message];
    msg.text = content;
    WBImageObject *imageObj = [WBImageObject object];
    imageObj.imageData = imageData;
    msg.imageObject = imageObj;
    
    WBSendMessageToWeiboRequest *req = [WBSendMessageToWeiboRequest requestWithMessage:msg];
    [WeiboSDK sendRequest:req];
}

@end

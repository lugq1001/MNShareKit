//
//  MNPlatformWeChat.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatformWeChat.h"
#import "WXApi.h"

@implementation MNPlatformWeChat

+ (void)shareToFriend:(NSString *)title
                desc:(NSString *)desc
           thumbnail:(NSData *)thumbnail
        mediaTagName:(NSString *)mediaTagName
                 url:(NSString *)url
{
    [self share:title desc:desc thumbnail:thumbnail mediaTagName:mediaTagName url:url scene:WXSceneSession];
}

+ (void)shareToTimeline:(NSString *)title
             thumbnail:(NSData *)thumbnail
          mediaTagName:(NSString *)mediaTagName
                   url:(NSString *)url
{
    [self share:title desc:title thumbnail:thumbnail mediaTagName:mediaTagName url:url scene:WXSceneTimeline];
}

+ (void)share:(NSString *)title
        desc:(NSString *)desc
   thumbnail:(NSData *)thumbnail
mediaTagName:(NSString *)mediaTagName
         url:(NSString *)url
       scene:(int)scene
{
    WXMediaMessage *message = [WXMediaMessage new];
    message.title = title;
    message.description = desc;
    message.thumbData = thumbnail;
    message.mediaTagName = mediaTagName;
    
    WXWebpageObject *wb = [WXWebpageObject new];
    wb.webpageUrl = url;
    
    message.mediaObject = wb;
    
    SendMessageToWXReq *req = [SendMessageToWXReq new];
    req.bText = false;
    req.scene = scene;
    req.message = message;
    [WXApi sendReq:req];
}

@end

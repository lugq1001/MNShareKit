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

+ (void)shareImageToFriend:(NSData *)image
                 thumbnail:(NSData *)thumbnail
                       url:(NSString *)url
{
    [self shareImage:image url:url thumbnail:thumbnail scene:WXSceneSession];
}

+ (void)shareImageToTimeline:(NSData *)image
                   thumbnail:(NSData *)thumbnail
                         url:(NSString *)url
{
    [self shareImage:image url:url thumbnail:thumbnail scene:WXSceneTimeline];
}

+ (void)shareImage:(NSData *)image
               url:(NSString *)url
         thumbnail:(NSData *)thumbnail
             scene:(int)scene
{
    WXMediaMessage *message = [WXMediaMessage new];
    WXImageObject *imageObj = [WXImageObject new];
    message.mediaObject = imageObj;
    
    if (scene == WXSceneSession) {// 好友
        message.thumbData = thumbnail;
        imageObj.imageUrl = url;
        imageObj.imageData = image;
    } else { // 朋友圈
        imageObj.imageData = image;
    }
    
    SendMessageToWXReq *req = [SendMessageToWXReq new];
    req.bText = false;
    req.scene = scene;
    req.message = message;
    [WXApi sendReq:req];
}


@end

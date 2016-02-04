//
//  MNPlatformQQ.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/4.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNPlatformQQ.h"
#import "MNShareKit.h"

@implementation MNPlatformQQ

+ (void)shareToQQ:(NSString *)title
          content:(NSString *)content
        thumbnail:(NSData *)thumbnail
              url:(NSString *)url
{
    [self share:title content:content thumbnail:thumbnail url:url qzone:false];
}

+ (void)shareToQZone:(NSString *)title
             content:(NSString *)content
           thumbnail:(NSData *)thumbnail
                 url:(NSString *)url
{
    [self share:title content:content thumbnail:thumbnail url:url qzone:true];
}

+ (void)share:(NSString *)title
      content:(NSString *)content
    thumbnail:(NSData *)thumbnail
          url:(NSString *)url
        qzone:(BOOL)qzone
{
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *shareUrl = [NSURL URLWithString:urlStr];
    QQApiNewsObject *msg = [QQApiNewsObject objectWithURL:shareUrl title:title description:content previewImageData:thumbnail];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:msg];
    if (qzone) {
        [QQApiInterface SendReqToQZone:req];
    } else {
        [QQApiInterface sendReq:req];
    }
}

@end

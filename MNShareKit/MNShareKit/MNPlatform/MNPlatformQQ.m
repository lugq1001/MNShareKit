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
            image:(NSData *)image
        thumbnail:(NSData *)thumbnail
              url:(NSString *)url
{
    [self share:title content:content image: image thumbnail:thumbnail url:url qzone:false];
}

+ (void)shareToQZone:(NSString *)title
             content:(NSString *)content
               image:(NSData *)image
           thumbnail:(NSData *)thumbnail
                 url:(NSString *)url
{
    [self share:title content:content image: image thumbnail:thumbnail url:url qzone:true];
}

+ (void)share:(NSString *)title
      content:(NSString *)content
        image:(NSData *)image
    thumbnail:(NSData *)thumbnail
          url:(NSString *)url
        qzone:(BOOL)qzone
{
    //    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //    NSURL *shareUrl = [NSURL URLWithString:urlStr];
    //    QQApiNewsObject *msg = [QQApiNewsObject objectWithURL:shareUrl title:title description:content previewImageData:thumbnail];
    QQApiImageObject *imgObj = [[QQApiImageObject alloc] initWithData:image previewImageData:thumbnail title:title description:content];
    
    
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:imgObj];
    if (qzone) {
        [QQApiInterface SendReqToQZone:req];
    } else {
        [QQApiInterface sendReq:req];
    }
}
@end

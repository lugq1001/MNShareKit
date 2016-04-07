//
//  MNShareKit.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNShareKit.h"
#import "MNShareView.h"
#import "MNPlatformWeChat.h"
#import "MNPlatformSinaWeibo.h"
#import "MNPlatformQQ.h"
#import "MNShareKit.h"


@interface MNShareKit () <MNShareViewDelegate>

@property (nonatomic) MNShareView *shareView;


@end

@implementation MNShareKit

static TencentOAuth *oauth;

static NSInteger shareTag = 52119944;

- (instancetype)initWithPlatforms:(NSArray *)platforms delegate:(id<MNShareKitDelegate>) delegate {
    if ([super init]) {
        _delegate = delegate;
        _shareView = [MNShareView new];
        _shareView.tag = shareTag;
        _shareView.platforms = platforms;
        _shareView.delegate = self;
        return self;
    }
    return nil;
}

- (void)showInView:(UIView *)view {
    [self addShareViewToView:view];
    [_shareView show];
}

- (void)addShareViewToView:(UIView *)view {
    BOOL exist = false;
    for (UIView *v in view.subviews) {
        if (v.tag == shareTag) {
            exist = true;
            break;
        }
    }
    if (!exist) {
        [view addSubview:_shareView];
    }
}

+ (void)weChatRegist {
    [WXApi registerApp:WeChatAppID];
}

+ (void)sinaWeiboRegist {
    [WeiboSDK registerApp:SinaWeiboAppID];
}

+ (BOOL)weChatInstalled {
    return [WXApi isWXAppInstalled];
}

+ (BOOL)qqInstalled {
    return [TencentOAuth iphoneQQInstalled];
}

+ (void)qqRegist {
    oauth = [[TencentOAuth alloc] initWithAppId:QQAppID andDelegate:[MNPlatformCallback sharedInstance]];
}

#pragma mark - MNShareViewDelegate
- (void)shareToPlatform:(MNPlatform *)platform {
    [_delegate shareKitDidPlatformSelected:platform];
    [_shareView dismiss];
}

- (void)share:(NSString *)title
      content:(NSString *)content
    thumbnial:(UIImage *)thumbnial
          url:(NSString *)url
     platform:(MNPlatform *)platform
{
    if (platform.type == MNPlatformTypeWeChatFriend) {
        NSData *data = UIImagePNGRepresentation(thumbnial);
        [MNPlatformWeChat shareToFriend:title desc:(NSString *)title thumbnail:data mediaTagName:@"" url:url];
    } else if (platform.type == MNPlatformTypeWeChatTimeline) {
        NSData *data = UIImagePNGRepresentation(thumbnial);
        [MNPlatformWeChat shareToTimeline:title thumbnail:data mediaTagName:@"" url:url];
    } else if (platform.type == MNPlatformTypeSinaWeibo) {
        NSData *data = UIImagePNGRepresentation(thumbnial);
        [MNPlatformSinaWeibo share:content imageData:data];
    } else if (platform.type == MNPlatformTypeQQFriend) {
        NSData *data = UIImagePNGRepresentation(thumbnial);
        [MNPlatformQQ shareToQQ:title content:content image:data thumbnail:data url:url];
    } else if (platform.type == MNPlatformTypeQQZone) {
        NSData *data = UIImagePNGRepresentation(thumbnial);
        [MNPlatformQQ shareToQZone:title content:content image:data thumbnail:data url:url];
    }
}

- (void)shareImage:(UIImage *)image
         thumbnial:(UIImage *)thumbnial
               url:(NSString *)url
          platform:(MNPlatform *)platform
{
    if (platform.type == MNPlatformTypeWeChatFriend) {
        UIImage *thumbnail =  [image scaleToSize:CGSizeMake(150, 150)];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
        NSData *data = UIImageJPEGRepresentation(thumbnail, 0.7);
        [MNPlatformWeChat shareImageToFriend:imageData thumbnail:data url:url];
    } else if (platform.type == MNPlatformTypeWeChatTimeline) {
        NSData *data = UIImagePNGRepresentation(image);
        [MNPlatformWeChat shareImageToTimeline:data thumbnail:nil url:url];
    } else if (platform.type == MNPlatformTypeSinaWeibo) {
        NSData *data = UIImageJPEGRepresentation(image, 0.7);
        [MNPlatformSinaWeibo share:@"太平乐享" imageData:data];
    } else if (platform.type == MNPlatformTypeQQFriend) {
        UIImage *thumbnail =  [image scaleToSize:CGSizeMake(150, 150)];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
        NSData *data = UIImageJPEGRepresentation(thumbnail, 0.7);
        [MNPlatformQQ shareToQQ:@"太平乐享" content:@"运动轨迹" image: imageData thumbnail:data url:url];
    } else if (platform.type == MNPlatformTypeQQZone) {
        UIImage *thumbnail =  [image scaleToSize:CGSizeMake(150, 150)];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
        NSData *data = UIImageJPEGRepresentation(thumbnail, 0.7);
        [MNPlatformQQ shareToQZone:@"太平乐享" content:@"运动轨迹" image: imageData thumbnail:data url:url];
    }
}




@end





@implementation UIImage (MNShareKit)
- (UIImage *)scaleToSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end










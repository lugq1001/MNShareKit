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



@interface MNShareKit () <MNShareViewDelegate>

@property (nonatomic) MNShareView *shareView;


@end

@implementation MNShareKit

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
    }
}


@end
















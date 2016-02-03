//
//  MNShareKit.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNShareKit.h"
#import "MNShareView.h"

@interface MNShareKit ()

@property (nonatomic) MNShareView *shareView;


@end

@implementation MNShareKit

static NSInteger shareTag = 52119944;

- (instancetype)init {
    if ([super init]) {
        _shareView = [MNShareView new];
        _shareView.tag = shareTag;
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

@end

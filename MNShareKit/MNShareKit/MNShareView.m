//
//  MNShareView.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNShareView.h"
#import "MNShareKit.h"


@interface MNShareView ()


@property (nonatomic) UIButton *cancelButton;

@end

@implementation MNShareView

static CGFloat platformViewH = 100.0;
static CGFloat cancelButtonH = 44.0;
//static CGFloat spacintV = 8.0;

- (instancetype)init {
    if ([super init]) {
        [self setup];
        return self;
    }
    return nil;
}

- (void)setup {
    self.frame = CGRectMake(0, 0, MNDeviceWidth, MNDeviceHeight);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    _platformView = [[UIView alloc] initWithFrame:CGRectMake(0, MNDeviceHeight - platformViewH, MNDeviceWidth, platformViewH)];
    _platformView.backgroundColor = [UIColor clearColor];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelButton.frame = CGRectMake(0, platformViewH - cancelButtonH, MNDeviceWidth, cancelButtonH);
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_platformView addSubview:_cancelButton];
     
    
    [self addSubview:_platformView];
}

- (void)show {
    self.alpha = 0;
    self.hidden = false;
    CGRect frame = _platformView.frame;
    frame.origin.y = MNDeviceHeight;
    _platformView.frame = frame;
    
    [UIView animateKeyframesWithDuration:0.35 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.alpha = 1;
        CGRect frame = _platformView.frame;
        frame.origin.y = MNDeviceHeight - platformViewH;
        _platformView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

@end

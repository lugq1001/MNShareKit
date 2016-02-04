//
//  MNShareView.h
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

@import UIKit;
#import "MNShareKit.h"

@protocol MNShareViewDelegate <NSObject>

- (void)shareToPlatform:(MNPlatform *)platform;

@end

@interface MNShareView : UIView

@property (nonatomic) NSArray *platforms;
@property (nonatomic) UIView *platformView;
@property (nonatomic) id<MNShareViewDelegate> delegate;

- (void)show;
- (void)dismiss;

@end

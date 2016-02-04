//
//  ViewController.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "ViewController.h"
#import "MNShareKit.h"

@interface ViewController () <MNShareKitDelegate>

@property (nonatomic) MNShareKit *shareKit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *platforms = [NSMutableArray new];
    if ([MNShareKit weChatInstalled]) {
        [platforms addObject:[MNPlatform create:MNPlatformTypeWeChatFriend]];
        [platforms addObject:[MNPlatform create:MNPlatformTypeWeChatTimeline]];
    }
    
    [platforms addObject:[MNPlatform create:MNPlatformTypeSinaWeibo]];
    if ([MNShareKit qqInstalled]) {
        [platforms addObject:[MNPlatform create:MNPlatformTypeQQFriend]];
        [platforms addObject:[MNPlatform create:MNPlatformTypeQQZone]];
    }
    
    _shareKit = [[MNShareKit alloc] initWithPlatforms:platforms delegate:self];
}

- (IBAction)share:(id)sender {
    [_shareKit showInView:self.view];
}

- (void)shareKitDidPlatformSelected:(MNPlatform *)platform {
    [_shareKit share:@"title" content:@"content" thumbnial:[UIImage imageNamed:@"ic_app"] url:@"http://www.baidu.com" platform:platform];
}

@end

//
//  ViewController.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "ViewController.h"
#import "MNShareKit.h"

@interface ViewController ()

@property (nonatomic) MNShareKit *shareKit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shareKit = [MNShareKit new];
}

- (IBAction)share:(id)sender {
    [_shareKit showInView:self.view];
}

@end

//
//  MNShareView.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "MNShareView.h"
#import "MNShareKit.h"
#import "MNPlatformCell.h"
#import "MNPlatform.h"


@interface MNShareView () <UICollectionViewDelegate, UICollectionViewDataSource>


@property (nonatomic) UIButton *cancelButton;
@property (nonatomic) UICollectionView *platformCollection;

@end

@implementation MNShareView

static CGFloat platformViewH = 150.0;
static CGFloat cancelButtonH = 44.0;
static CGFloat collectionH = 80.0;
static CGFloat spacintV = 8.0;

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
    [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    _cancelButton.backgroundColor = [UIColor whiteColor];
    [_platformView addSubview:_cancelButton];
    
    _platformCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, ((platformViewH - cancelButtonH - spacintV) - collectionH) / 2, MNDeviceWidth, collectionH) collectionViewLayout:[self layout]];
    [_platformCollection registerNib:[UINib nibWithNibName:@"MNPlatformCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MNPlatformCell"];
    _platformCollection.backgroundColor = [UIColor whiteColor];
    _platformCollection.showsHorizontalScrollIndicator = false;
    _platformCollection.showsVerticalScrollIndicator = false;
    _platformCollection.delegate = self;
    _platformCollection.dataSource = self;
    [_platformView addSubview:_platformCollection];
    
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

- (void)dismiss {
    [UIView animateKeyframesWithDuration:0.35 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.alpha = 0;
        CGRect frame = _platformView.frame;
        frame.origin.y = MNDeviceHeight;
        _platformView.frame = frame;
    } completion:^(BOOL finished) {
        self.hidden = true;
    }];
}
                           
- (UICollectionViewFlowLayout *)layout {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(collectionH, collectionH);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return layout;
}

#pragma mark - collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_platforms count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MNPlatformCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MNPlatformCell" forIndexPath:indexPath];
    MNPlatform *platform = _platforms[indexPath.row];
    cell.iPlatformImage.image = [UIImage imageNamed:platform.icon];
    cell.iPlatformLabel.text = platform.name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:true];
    MNPlatform *platform = _platforms[indexPath.row];
    if (_delegate != nil) {
        [_delegate shareToPlatform:platform];
    }
}


@end

//
//  YWLoopViewLayout.m
//  YWLoopView
//
//  Created by coder on 2018/2/26.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "YWLoopViewLayout.h"

@implementation YWLoopViewLayout
/**
 在collectionView的第一次布局的时候，被调用，此时 collectionView的frame已经设置好了
 */
- (void)prepareLayout
{
    // 一定要调用super
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}
@end

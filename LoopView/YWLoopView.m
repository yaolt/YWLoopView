//
//  YWLoopView.m
//  YWLoopView
//
//  Created by coder on 2018/2/26.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "YWLoopView.h"
#import "YWLoopViewLayout.h"
#import "YWLoopViewCell.h"

@interface YWLoopView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray <NSURL *> *urls;
@end

@implementation YWLoopView{
    
}

- (instancetype)initWithURLs:(NSArray<NSURL *> *)urls
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[YWLoopViewLayout alloc] init]];
    if(self){
        _urls = urls;
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[YWLoopViewCell class] forCellWithReuseIdentifier:@"YWLoopViewCell"];
        /**
         主队列：
         1、安排任务在主线程上执行
         2、如果主线程当前有任务，主队列暂时不调度任务
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.urls.count * 500 inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _urls.count * 1000;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YWLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YWLoopViewCell" forIndexPath:indexPath];
    cell.url = _urls[indexPath.item % _urls.count];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获取当前停止的页面
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 第0页，跳转到第一组的第0页
    // 最后一页，跳转到第0组的最后一页
    if(offset == 0 || offset == [self numberOfItemsInSection:0]){
        if(offset == 0){
            offset = _urls.count;
        }else{
            offset = _urls.count - 1;
        }
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}

- (void)dealloc
{
    NSLog(@"轮播图销毁");
}
@end

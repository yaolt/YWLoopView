//
//  YWLoopViewCell.m
//  YWLoopView
//
//  Created by coder on 2018/2/26.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "YWLoopViewCell.h"

@implementation YWLoopViewCell{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
        _imageView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setUrl:(NSURL *)url
{
    _url = url;
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = image;
}

@end

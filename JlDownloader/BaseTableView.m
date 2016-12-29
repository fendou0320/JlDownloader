//
//  BaseTableView.m
//  JlDownloader
//
//  Created by 王江亮 on 16/12/16.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "BaseTableView.h"

static NSString *identity = @"SingleVideoGuessLikeViewCell";

@interface BaseTableView()
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BaseTableView

+ (instancetype)baseTableViewWithFrame:(CGRect)frame delegate:(id<BaseTableViewDelegate>)delegate{
    BaseTableView *view = [[BaseTableView alloc] initWithFrame:frame];
    view.delegate = delegate;
    return view;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 36/2, self.frame.size.width, self.frame.size.height - 36/2 - 12/2) style:UITableViewStylePlain];
        
//        self.tableView.scrollEnabled = NO;
        self.tableView.separatorStyle = NO;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identity];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return self.dataArr.count;
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.contentView.backgroundColor = [self randomColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(baseTableView:indexpath:)]) {
        [self.delegate baseTableView:self indexpath:indexPath];
    }
}

- (void)setDataArr:(NSMutableArray *)dataArr{

    _dataArr = dataArr;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 186/2;
}

- (UIColor *) randomColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end

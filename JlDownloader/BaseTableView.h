//
//  BaseTableView.h
//  JlDownloader
//
//  Created by 王江亮 on 16/12/16.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableView;

@protocol BaseTableViewDelegate <NSObject>
@optional
- (void)baseTableView: (BaseTableView *)selfView indexpath: (NSIndexPath *)indexpath;
@end

@interface BaseTableView : UIView<UITableViewDelegate, UITableViewDataSource>

+ (instancetype)baseTableViewWithFrame:(CGRect)frame delegate:(id<BaseTableViewDelegate>)delegate;

@property (nonatomic, weak) id<BaseTableViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *dataArr;


@end

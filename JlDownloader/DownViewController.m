//
//  DownViewController.m
//  JlDownloader
//
//  Created by 王江亮 on 16/12/16.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "DownViewController.h"

@interface DownViewController ()

@end

@implementation DownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor greenColor];

    CommentInputView *view = [CommentInputView commentInputViewWithframe:CGRectMake(50, 100, 200, 100)];
//    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    view.textView.placeholder = @"回复XXX";

    view.clickBlock = ^(NSString *contentStr){
    
        NSLog(@"%@", contentStr);
    };
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

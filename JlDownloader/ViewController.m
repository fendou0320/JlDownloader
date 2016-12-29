//
//  ViewController.m
//  JlDownloader
//
//  Created by 王江亮 on 16/12/14.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "ViewController.h"
#import "ZoomImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
    
//    BaseTableView *view = [BaseTableView baseTableViewWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500) delegate:self];
//    [self.view addSubview:view];
    
    ZoomImageView *zoo = [[ZoomImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    [zoo setImage:[UIImage imageNamed:@"1072X740.png"]];
    [self.view addSubview:zoo];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)actionClick:(UIButton *)sender{

    NSString *urlStr = @"http://dldir1.qq.com/qqfile/QQforMac/QQ_V4.2.4.dmg";
    
    // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
    NSString *name = [[urlStr componentsSeparatedByString:@"/"] lastObject];
    
//    [[JLDownloadManager sharedDownloadManager] downFileUrl:urlStr filename:name fileimage:nil];
    
    // 设置最多同时下载个数（默认是3）
    [JLDownloadManager sharedDownloadManager].maxCount = 2;
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  JLDownloadManager.h
//  JlDownloader
//
//  Created by 王江亮 on 16/12/19.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHelper.h"
#import "FileModel.h"

#define kMaxRequestCount @"kMaxRequestCount"

@interface JLDownloadManager : NSObject

/**
 最大并发数
 */
@property (nonatomic, assign) NSInteger maxCount;
/** 
 未下载完成的临时文件数组（文件对象) 
 */
@property (atomic, strong, readonly) NSMutableArray *filelist;
/**
 正在下载的文件列表 (ASIHttpRequest对象)
 */
@property (atomic, strong, readonly) NSMutableArray *downinglist;
/**
 已经下载的文件列表 (文件对象)
 */
@property (atomic, strong, readonly) NSMutableArray *finishedlist;


+ (instancetype)sharedDownloadManager;



@end

//
//  CommonHelper.h
//  JlDownloader
//
//  Created by 王江亮 on 16/12/19.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 下载文件的总文件夹
#define BASE       @"JLDownLoad"
// 完整文件路径
#define TARGET     @"CacheList"
// 临时文件夹名称
#define TEMP       @"Temp"
// 缓存主目录
#define CACHES_DIRECTORY     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
// 临时文件夹的路径
#define TEMP_FOLDER          [NSString stringWithFormat:@"%@/%@/%@",CACHES_DIRECTORY,BASE,TEMP]
// 临时文件的路径
#define TEMP_PATH(name)      [NSString stringWithFormat:@"%@/%@",[JLCommonHelper createFolder:TEMP_FOLDER],name]
// 下载文件夹路径
#define FILE_FOLDER          [NSString stringWithFormat:@"%@/%@/%@",CACHES_DIRECTORY,BASE,TARGET]
// 下载文件的路径
#define FILE_PATH(name)      [NSString stringWithFormat:@"%@/%@",[JLCommonHelper createFolder:FILE_FOLDER],name]
// 文件信息的Plist路径
#define PLIST_PATH           [NSString stringWithFormat:@"%@/%@/FinishedPlist.plist",CACHES_DIRECTORY,BASE]


@interface CommonHelper : NSObject

@end

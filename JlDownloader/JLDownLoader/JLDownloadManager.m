//
//  JLDownloadManager.m
//  JlDownloader
//
//  Created by 王江亮 on 16/12/19.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "JLDownloadManager.h"

static JLDownloadManager *sharedDownloadManager = nil;

@interface JLDownloadManager ()
/**
 未下载完成的临时文件数组（文件对象)
 */
@property (atomic, strong) NSMutableArray *filelist;
/**
 正在下载的文件列表 (ASIHttpRequest对象)
 */
@property (atomic, strong) NSMutableArray *downinglist;
/**
 已经下载的文件列表 (文件对象)
 */
@property (atomic, strong) NSMutableArray *finishedlist;
/**
 本地临时文件夹的个数
 */
@property (nonatomic, assign) NSInteger count;
@end

@implementation JLDownloadManager

+ (instancetype)sharedDownloadManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDownloadManager = [[JLDownloadManager alloc] init];
    });
    return sharedDownloadManager;
}


- (instancetype)init{

    self = [super init];
    if (self) {
        //设置最大并发数
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *max = [userDefaults objectForKey:kMaxRequestCount];
        if (max == nil) {
            [userDefaults setValue:@"3" forKey:kMaxRequestCount];
            max = @"3";
        }
        [userDefaults synchronize];
        //创建基本配置
        _maxCount = [max integerValue];
        _filelist = [[NSMutableArray alloc] init];
        _downinglist = [[NSMutableArray alloc] init];
        _finishedlist = [[NSMutableArray alloc] init];
        _count = 0;
        
        [self loadFinishedfiles];
        [self loadTempfiles];

    }
    return self;
}
#pragma mark - 已完成的下载任务在这里处理
/*
	将本地已经下载完成的文件加载到已下载列表里
 */
- (void)loadFinishedfiles{

    if ([[NSFileManager defaultManager] fileExistsAtPath:PLIST_PATH]) {
        NSMutableArray *finishArr = [[NSMutableArray alloc] initWithContentsOfFile:PLIST_PATH];
        for (NSDictionary *dic in finishArr) {
            FileModel *file = [[FileModel alloc] init];
            file.fileName = [dic objectForKey:@"filename"];
            file.fileType = [file.fileName pathExtension];
            file.fileSize = [dic objectForKey:@"filesize"];
            file.time = [dic objectForKey:@"time"];
            file.fileimage = [UIImage imageNamed:[dic objectForKey:@"fileimage"]];
            [_finishedlist addObject:file];
        }
    }
}

#pragma mark - 从这里获取上次未完成下载的信息
/*
 将本地的未下载完成的临时文件加载到正在下载列表里,但是不接着开始下载
 
 */
- (void)loadTempfiles{

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *filelist = [fileManager contentsOfDirectoryAtPath:TEMP_FOLDER error:&error];
    if (!error) {
        NSLog(@"%@",[error description]);
    }
    
    NSMutableArray *filearr = [[NSMutableArray alloc]init];
    for (NSString *file in filelist) {
        NSString *filetype = [file  pathExtension];
        if([filetype isEqualToString:@"plist"]){
        
//        [filearr addObject:[self getTempfile:TEMP_PATH(file)]];
            
        }
    }
}

- (FileModel *)getTempfile:(NSString *)path
{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    FileModel *file = [[FileModel alloc]init];
    file.fileName = [dic objectForKey:@"filename"];
    file.fileType = [file.fileName pathExtension ];
    file.fileURL = [dic objectForKey:@"fileurl"];
    file.fileSize = [dic objectForKey:@"filesize"];
    file.fileReceivedSize = [dic objectForKey:@"filerecievesize"];
    
//    file.tempPath = TEMP_PATH(file.fileName);
    file.time = [dic objectForKey:@"time"];
    file.fileimage = [UIImage imageWithData:[dic objectForKey:@"fileimage"]];
    file.downState = DownLoadStateStop;
    file.error = NO;
    
    NSData *fileData = [[NSFileManager defaultManager ] contentsAtPath:file.tempPath];
    NSInteger receivedDataLength = [fileData length];
    file.fileReceivedSize = [NSString stringWithFormat:@"%zd",receivedDataLength];
    return file;
}


@end

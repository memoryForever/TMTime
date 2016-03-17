//
//  TQWTodayMovies.m
//  TMtime
//
//  Created by tarena33 on 16/3/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWTodayMovies.h"

static dispatch_queue_t _TQWTodayMoviesQueque;
@implementation TQWTodayMovies
-(instancetype)initWithMoieId:(NSString *)MoveId name:(NSString *)name picURL:(NSString *)URL{
    self = [super init];
    if (self) {
        if (!_TQWTodayMoviesQueque) {
            _TQWTodayMoviesQueque = dispatch_queue_create("tqwTodayMoviesQueue", DISPATCH_QUEUE_CONCURRENT);
        }
        self.TQWMovieId = MoveId;
        self.TQWMovieName = name;
        self.TQWMoviePicURL = URL;
    }
    return self;
}
+(instancetype)todayMoviesWithMoieId:(NSString *)MoveId name:(NSString *)name picURL:(NSString *)URL{
    return [[TQWTodayMovies alloc]initWithMoieId:MoveId name:name picURL:URL] ;
}
-(void)setTQWMoviePicURL:(NSString *)TQWMoviePicURL{
    _TQWMoviePicURL = TQWMoviePicURL;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self saveImagePath]]) {
        [self getImageForImagePath:[self saveImagePath]];
        return ;
    }
    [self getImageForImageUrl:TQWMoviePicURL];
}
/** 获取图片 从网络 **/
-(void)getImageForImageUrl:(NSString*)urlString{
  __weak  id mySelf = self;
    dispatch_async(_TQWTodayMoviesQueque, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        _TQWMovieImage = [UIImage imageWithData:data];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateTodayImage" object:mySelf userInfo:@{@"moveId":_TQWMovieId}];
        [mySelf saveImageToFilePath:[mySelf saveImagePath] writeData:data];
    });
}

/** 获取图片,从硬盘 **/
-(void)getImageForImagePath:(NSString*)path{
      __weak  id mySelf = self;
      dispatch_async(_TQWTodayMoviesQueque, ^{
          NSData *data = [NSData dataWithContentsOfFile:path];
          _TQWMovieImage = [UIImage imageWithData:data];
          
          dispatch_async(dispatch_get_main_queue(), ^{
                   [[NSNotificationCenter defaultCenter] postNotificationName:@"updateTodayImage" object:mySelf userInfo:@{@"moveId":_TQWMovieId}];
          });
    
      });
}

/** 保存图片到本地 **/
-(void)saveImageToFilePath:(NSString*)path writeData:(NSData*)data{
    dispatch_async(_TQWTodayMoviesQueque, ^{
      NSFileHandle *fh  = [NSFileHandle fileHandleForWritingAtPath:path];
        [fh writeData:data];
        [fh closeFile];
    });
}
-(NSString*)saveImagePath{
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"moviesTodayImage/%@%@",_TQWMovieId,_TQWMovieName]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        /** 文件路径不存在,创建文件路径 **/
        NSError *error ;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"--56 文件创建错误\n%@",error);
        }
    };
    
    return path ;
}

@end

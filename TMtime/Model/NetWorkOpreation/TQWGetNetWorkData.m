//
//  TQWGetNetWorkData.m
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWGetNetWorkData.h"
@interface TQWGetNetWorkData()
/** 数据请求完成block **/
@property(nonatomic,copy)DID_FINISH_DATA_REQUEST_BLOCK didFinishDataRequest_block;
@end

/** 单例标志 **/
//static TQWGetNetWorkData*  _getNetworkDataObject;

@implementation TQWGetNetWorkData
-(instancetype)init{
    self = [super init];
    if (self) {
        ;
    }
    return self ;
}
//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _getNetworkDataObject = [super allocWithZone:zone];
//    });
//    return _getNetworkDataObject;
//}

-(instancetype)initWithHttpUrl:(NSString *)httpUrl HttpArg:(NSString *)httpArg andAPIKEY:(NSString *)KEY {
    self = [super init];
    if (self) {
        [self request:httpUrl withHttpArg:httpArg andAPIKEY:KEY];
    }
    return self ;
}

+(instancetype)getNetworkDataWithHttpUrl:(NSString*)httpUrl HttpArg:(NSString*)httpArg andAPIKEY:(NSString*)KEY{
    
    return [[TQWGetNetWorkData alloc]initWithHttpUrl:httpUrl HttpArg:httpArg andAPIKEY:KEY];
}

+(instancetype)getNetWorkData{
    return [[TQWGetNetWorkData alloc]init];
}
-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg andAPIKEY:(NSString*)KEY{
    NSString *urlString = [NSString stringWithFormat:@"%@?%@&%@",httpUrl,KEY,HttpArg];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask  *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"数据请求出错了-------\n%@",error);
        }
        NSError *parserError;
        /** 对json相关数据的处理 **/
        NSDictionary *dictionary  = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parserError];
        if (parserError) {
            NSLog(@"45行-- 解析数据出错");
        }
        _didFinishDataRequest_block(dictionary);
    }];
    //启动任务
    [dataTask resume];
}
-(void)addActiondidFinishDataRequest:(DID_FINISH_DATA_REQUEST_BLOCK)didFinishDataRequestBlock{
    self.didFinishDataRequest_block = didFinishDataRequestBlock ;
}


@end



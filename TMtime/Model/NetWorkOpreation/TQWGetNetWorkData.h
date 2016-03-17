//
//  TQWGetNetWorkData.h
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^DID_FINISH_DATA_REQUEST_BLOCK)(NSDictionary *dictionary);
@interface TQWGetNetWorkData : NSObject
+(instancetype)getNetWorkData;
-(instancetype)initWithHttpUrl:(NSString*)httpUrl HttpArg:(NSString*)httpArg andAPIKEY:(NSString*)KEY;
+(instancetype)getNetworkDataWithHttpUrl:(NSString*)httpUrl HttpArg:(NSString*)httpArg andAPIKEY:(NSString*)KEY;
/**
 *  获取网络数据完成的事件
 *
 *  @param didFinishDataRequestBlock
 */
-(void)addActiondidFinishDataRequest:(DID_FINISH_DATA_REQUEST_BLOCK)didFinishDataRequestBlock;
-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg andAPIKEY:(NSString*)KEY;
@end

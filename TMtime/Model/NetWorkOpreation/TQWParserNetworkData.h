//
//  TQWParserNetworkData.h
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TQWGetNetWorkData.h"
#import "TQWTodayMovies.h"
typedef enum {
    TQW_MOVIE ,
} TQW_URL_TYPE;


@interface TQWParserNetworkData : NSObject
/** 解析今日电影数据 **/
+(NSMutableArray<TQWTodayMovies*>*)parserTodayMoviesData:(NSDictionary*)dictionary;
@end

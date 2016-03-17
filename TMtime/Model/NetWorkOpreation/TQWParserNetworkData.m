//
//  TQWParserNetworkData.m
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWParserNetworkData.h"

@implementation TQWParserNetworkData
+(NSMutableArray<TQWTodayMovies*> *)parserTodayMoviesData:(NSDictionary *)dictionary{
    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:20];
    if (!dictionary) {
        NSLog(@"error 15 -- 字典数据为空");
        return nil ;
    }
    NSArray *dataArray = dictionary[@"result"];
    for (NSDictionary* dic  in dataArray) {
    TQWTodayMovies *movie = [TQWTodayMovies todayMoviesWithMoieId:dic[@"movieId"]
                                                             name:dic[@"movieName"]
                                                           picURL:dic[@"pic_url"]];
        [marray addObject:movie];
    }
    return marray;
}
@end

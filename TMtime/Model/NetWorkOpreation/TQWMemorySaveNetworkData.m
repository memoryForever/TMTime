//
//  TQWMemorySaveNetworkData.m
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWMemorySaveNetworkData.h"
#import "TQWGetNetWorkData.h"
#import "TQWParserNetworkData.h"

@interface TQWMemorySaveNetworkData()
@property(nonatomic ,strong)NSString *cityId;
@end

static TQWMemorySaveNetworkData* _TQWMemoryData;
@implementation TQWMemorySaveNetworkData
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _TQWMemoryData = [super allocWithZone:zone];
    });
    return _TQWMemoryData;
}

+(instancetype)ShareMemoryData{
    
    return [[TQWMemorySaveNetworkData alloc]init];
}
-(instancetype)init{
    self = [super init];
    if (self) {
        if (_cityId == nil) {
            _cityId = [self getCurrentCityId];
        }
        if (_dataDictionary == nil ) {
            _dataDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
        }
   
    }
    return self;
}

/**
 *  获取当前的城市id
 */
-(NSString*)getCurrentCityId{
    
    return @"3";
}

-(void)getTodayMovies{
    TQWGetNetWorkData *getnetworkData = [TQWGetNetWorkData getNetworkDataWithHttpUrl:@"http://v.juhe.cn/movie/movies.today"
                          HttpArg:[NSString stringWithFormat:@"cityid=%@",_cityId]
                        andAPIKEY:APIKEY];
    [getnetworkData addActiondidFinishDataRequest:^(NSDictionary *dictionary) {
      NSMutableArray *dataArray = [TQWParserNetworkData parserTodayMoviesData:dictionary];
      [_dataDictionary setObject:dataArray forKey:@"todayMovies"];
      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
          [[NSNotificationCenter defaultCenter] postNotificationName:@"todayDataUpdate" object:self userInfo:@{@"nameKey":@"todayMovies"}];
      }];
    }];
}



@end

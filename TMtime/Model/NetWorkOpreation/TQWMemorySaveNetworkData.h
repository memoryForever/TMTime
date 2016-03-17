//
//  TQWMemorySaveNetworkData.h
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TQWMemorySaveNetworkData : NSObject
@property(nonatomic,strong)NSMutableArray *array ;
@property(nonatomic,strong)NSMutableDictionary *dataDictionary;
-(void)getTodayMovies;
+(instancetype)ShareMemoryData;
@end

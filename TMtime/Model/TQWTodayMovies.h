//
//  TQWTodayMovies.h
//  TMtime
//
//  Created by tarena33 on 16/3/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TQWTodayMovies : NSObject

@property(nonatomic,strong)NSString* TQWMovieId;
/**电影名**/
@property(nonatomic,strong) NSString *TQWMovieName;
/**电影图片URL**/
@property(nonatomic,strong) NSString *TQWMoviePicURL;
@property(nonatomic,strong) UIImage *TQWMovieImage;
-(instancetype)initWithMoieId:(NSString*)MoveId name:(NSString*)name picURL:(NSString*)URL;
+(instancetype)todayMoviesWithMoieId:(NSString*)MoveId name:(NSString*)name picURL:(NSString*)URL;
@end

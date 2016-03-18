//
//  TQWTodayMoviesConllectionViewFlowLayout.m
//  TMtime
//
//  Created by tarena33 on 16/3/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWTodayMoviesConllectionViewFlowLayout.h"

@implementation TQWTodayMoviesConllectionViewFlowLayout
-(instancetype)init{
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 10 ;
        self.minimumInteritemSpacing = 10 ;
        self.itemSize = CGSizeMake(120,230);
        self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}
@end

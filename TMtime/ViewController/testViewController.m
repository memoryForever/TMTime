//
//  testViewController.m
//  TMtime
//
//  Created by tarena33 on 16/3/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "testViewController.h"
#import "TQWGetNetWorkData.h"
#import "TQWTodayMoviesCollectionViewController.h"
#import "TQWTodayMoviesConllectionViewFlowLayout.h"
#import <Masonry/Masonry.h>


@interface testViewController ()
@property(nonatomic,strong)TQWTodayMoviesCollectionViewController *todayMoveTodayMovies;
@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    
}
-(void)setupCollectionView{
    
    self.todayMoveTodayMovies = [[TQWTodayMoviesCollectionViewController alloc]initWithCollectionViewLayout:[[TQWTodayMoviesConllectionViewFlowLayout alloc]init]];
    [self addChildViewController:self.todayMoveTodayMovies];
    [self.view addSubview:self.todayMoveTodayMovies.view];
    self.todayMoveTodayMovies.view.translatesAutoresizingMaskIntoConstraints = NO ;
    [self.todayMoveTodayMovies.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(@120);
    }];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  TQWTodayMoviesCollectionViewController.m
//  TMtime
//
//  Created by tarena33 on 16/3/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWTodayMoviesCollectionViewController.h"
#import "TQWMemorySaveNetworkData.h"
#import "TQWTodayMovies.h"
#import "TQWTodayMoviesCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface TQWTodayMoviesCollectionViewController ()
@property(nonatomic,strong)NSArray <TQWTodayMovies*> *allData;
@property(nonatomic,strong)TQWMemorySaveNetworkData *memoryData;
@end

@implementation TQWTodayMoviesCollectionViewController

-(NSArray<TQWTodayMovies *> *)allData{
    if (!_allData) {
        _allData = self.memoryData.dataDictionary[@"todayMovies"];
    }
    return _allData ;
}

static NSString * const reuseIdentifier = @"Cell";

-(TQWMemorySaveNetworkData *)memoryData{
    if (!_memoryData) {
        _memoryData = [TQWMemorySaveNetworkData ShareMemoryData];
    }
    return _memoryData  ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.memoryData getTodayMovies];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData:) name:@"todayDataUpdate" object:nil];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[TQWTodayMoviesCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}


-(void)updateData:(NSNotification*)notification{
    [self.collectionView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateImage:) name:@"updateTodayImage" object:nil];
}
-(void)updateImage:(NSNotification*)notification{
    NSInteger index = 0 ;
    NSString *indexString = notification.userInfo[@"moveId"];
    for (TQWTodayMovies *moves in self.allData) {
        if ([moves.TQWMovieId isEqualToString:indexString]) {
            break   ;
        }
        index ++ ;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
   [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
   // [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.allData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   TQWTodayMoviesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    TQWTodayMovies *moves = self.allData[indexPath.item];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
    imageView.image = moves.TQWMovieImage ? moves.TQWMovieImage : [UIImage imageNamed:@"head1"];
    [cell.contentView addSubview:imageView];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
-(void)viewDidAppear:(BOOL)animated{
    
}
@end

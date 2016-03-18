//
//  TQWTodayMoviesCollectionViewCell.m
//  TMtime
//
//  Created by tarena33 on 16/3/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TQWTodayMoviesCollectionViewCell.h"

@interface TQWTodayMoviesCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *moviesImage;
@property (weak, nonatomic) IBOutlet UILabel *moviesName;
@property (weak, nonatomic) IBOutlet UIButton *buyTicketButton;

@end

@implementation TQWTodayMoviesCollectionViewCell
- (IBAction)buyTicketButton:(UIButton *)sender {
    /** 点中了购票按钮 **/
}

-(void)setCellMoviesImage:(UIImage*)image Name:(NSString*)name {
    if (image) {
       self.moviesImage.image = image;
    }
    self.moviesName.text = name;
}

- (void)awakeFromNib {
    
}

@end

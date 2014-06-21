//
//  TimeLineCell.h
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/14.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineCell : UITableViewCell
@property (nonatomic , strong) UILabel *tweetTextLabel;
@property (nonatomic , strong) UILabel *nameLabel;
@property (nonatomic , strong) UIImageView *profileImageView;
@property (nonatomic) float tweetTextLabelHeight;
@end

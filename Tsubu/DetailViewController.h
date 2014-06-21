//
//  DetailViewController.h
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/20.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "AppDelegate.h"


@interface DetailViewController : UIViewController
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *idStr;

@end

//
//  WebViewController.h
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/21.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic , strong) NSURL *openURL;

@end

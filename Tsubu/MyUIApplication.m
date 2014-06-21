//
//  MyUIApplication.m
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/20.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import "MyUIApplication.h"
#import "AppDelegate.h"
#import "WebViewController.h"

@implementation MyUIApplication


- (BOOL)openURL:(NSURL *)url
{
    if (!url) {
        return NO;
    }
    
    self.myOpenURL = url;
    AppDelegate *appDelegate = (AppDelegate *)[self delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    WebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.openURL = self.myOpenURL;
    webViewController.title = @"Web View";
    [appDelegate.navigationController pushViewController:webViewController animated:YES];
    self.myOpenURL = nil;
    return YES;
}


@end

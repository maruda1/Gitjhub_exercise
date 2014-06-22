//
//  main.m
//  Tsubu
//
//  Created by 丸川大輝 on 2014/06/14.
//  Copyright (c) 2014年 丸川大輝. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "MyUIApplication.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, NSStringFromClass([MyUIApplication class]),//カスタムクラス名
                                 NSStringFromClass([AppDelegate class]));
    }
}

//
//  AppDelegate.m
//  QiuShiBaiKe
//
//  Created by qianfeng07 on 15/11/28.
//  Copyright © 2015年 JasonZhang. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)createControllersFor:(UITabBarController *)tbc
{
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    NSArray *titles = @[@[@"Top", @"icon_top_", @"最糗"], @[@"New", @"icon_new_", @"最新"], @[@"My", @"icon_my_", @"我的糗事"]];
    for (NSUInteger i = 0; i < titles.count; i++) {
        NSString *name = [NSString stringWithFormat:@"%@ViewController", titles[i][0]];
        Class cls = NSClassFromString(name);
        BaseViewController *bvc = [[cls alloc] init];
        NSString *normalImageName = [NSString stringWithFormat:@"%@enable", titles[i][1]];
        UIImage *normalImage = [[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        NSString *selectedImageName = [NSString stringWithFormat:@"%@active", titles[i][1]];
        UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:nil image:normalImage selectedImage:selectedImage];
        bvc.tabBarItem = item;
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:bvc];
        [self customNavigationFor:bvc];
        nc.title = titles[i][2];
        [controllers addObject:nc];
    }
    tbc.viewControllers = controllers;
}

- (void)customNavigationFor:(BaseViewController *)bvc
{
    UIImage *image = [UIImage imageNamed:@"head_background"];
    [bvc.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:30];
    label.text = bvc.navigationController.title;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    [view addSubview:label];
    bvc.navigationItem.titleView = view;
    
    UIImage *rightImage = [[UIImage imageNamed:@"icon_post_enable"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:bvc action:@selector(rightItemAction:)];
    bvc.navigationItem.rightBarButtonItem = rightItem;
    
    UIImage *leftImage = [[UIImage imageNamed:@"icon_pic_enable"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:bvc action:@selector(leftItemAction:)];
    bvc.navigationItem.leftBarButtonItem = leftItem;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tbc = [[UITabBarController alloc] init];
    UIImage *image = [UIImage imageNamed:@"bar_background"];
    [tbc.tabBar setBackgroundImage:image];
    [self createControllersFor:tbc];
    self.window.rootViewController = tbc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

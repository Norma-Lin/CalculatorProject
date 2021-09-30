//
//  AppDelegate.m
//  CalculatorProject
//
//  Created by Richard on 2020/7/14.
//  Copyright © 2020 CalculatorProject. All rights reserved.
//

#import "AppDelegate.h"
#import "CalculatorViewController.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) IBOutlet UINavigationController *m_rootNavigationController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;

    self.window.rootViewController = nil;
    self.window.rootViewController = self.m_rootNavigationController;
    
    // Push First ViewController
    UIViewController *vc = [[FirstViewController alloc] init];
    [self.m_rootNavigationController pushViewController:vc animated:YES];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end

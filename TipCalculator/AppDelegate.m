//
//  AppDelegate.m
//  TipCalculator
//
//  Created by Jeffrey Okamoto on 1/9/17.
//  Copyright © 2017 Jeffrey Okamoto. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

int CLEAR_FIELD_SECONDS = 300;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *lastDate = [defaults objectForKey:@"tipLastCloseDate"];
    NSTimeInterval timeDiff = [[NSDate date] timeIntervalSinceDate:lastDate];
    NSLog(@"application says Time since last close: %f", timeDiff);
    if (timeDiff > CLEAR_FIELD_SECONDS) {
        NSLog(@"Nulling out billAmount");
        [defaults setObject:@"" forKey:@"billAmount"];
        [defaults synchronize];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:@"tipLastCloseDate"];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *lastDate = [defaults objectForKey:@"tipLastCloseDate"];
    NSTimeInterval timeDiff = [[NSDate date] timeIntervalSinceDate:lastDate];
    NSLog(@"applicationWillEnterForeground says Time since last close: %f", timeDiff);
    if (timeDiff > CLEAR_FIELD_SECONDS) {
        NSLog(@"Nulling out billAmount");
        [defaults setObject:@"" forKey:@"billAmount"];
        [defaults synchronize];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:@"tipLastCloseDate"];
}



@end

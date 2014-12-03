//
//  GMAppDelegate.m
//  GMClipper
//
//  Created by CocoaPods on 12/03/2014.
//  Copyright (c) 2014 Richard Moore. All rights reserved.
//

#import "GMAppDelegate.h"

#import "GMClipper.h"
#import "GMClipperOffset.h"

@implementation GMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Quick test for something to place in the readme.
    {
        // Create a subject polygon
        GMPolygon *subject = [GMPolygon polygon];
        [subject addPointX:0 y:0];
        [subject addPointX:100 y:100];
        [subject addPointX:100 y:0];

        // Create a clipping polygon (50x50 rectangle)
        GMPolygon *clipping = [GMPolygon polygon];
        [clipping addPointX:0 y:0];
        [clipping addPointX:0 y:50];
        [clipping addPointX:50 y:50];
        [clipping addPointX:50 y:0];

        // Prepare the subject with the clipping polygon for clipping
        GMClipper *clipper = [GMClipper clipper];
        [clipper addSubjectPolygon:subject];
        [clipper addClippingPolygon:clipping];
        
        // Compute the new polygon(s)
        NSArray *result = [clipper executeClipType:ClipTypeIntersection];

        NSLog(@"Result: %@", result);
    }

    {
        // Create a triangle
        GMPolygon *triangle = [GMPolygon polygon];
        [triangle addPointX:0 y:0];
        [triangle addPointX:100 y:100];
        [triangle addPointX:100 y:0];

        // Prepare the triangle for enlarging (or shrinking)
        GMClipperOffset *clipperOffset = [GMClipperOffset clipperOffset];
        [clipperOffset addPolygon:triangle joinType:JoinTypeSquare endType:EndTypeClosedPolygon];
    
        // Compute the triangle enlarged by 10 points
        NSArray *result = [clipperOffset executeDelta:10];

        NSLog(@"Result: %@", result);
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

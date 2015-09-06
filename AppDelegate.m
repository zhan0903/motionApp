//
//  AppDelegate.m
//  demo3
//
//  Created by 郑涵 on 15/8/28.
//  Copyright © 2015年 nick. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate () <CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation AppDelegate

@synthesize Motion;

static NSString *pre_recognize;
static NSString *recoginze;
static NSString *temp_time;

-(CLLocationManager *)locMgr
{
    if (_locationManager==nil) {
        self.locationManager=[[CLLocationManager alloc]init];
        self.locationManager.delegate=self;
    }
    return _locationManager;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@" yy-MM-dd HH:mm";
    NSString *datestr=[formater1 stringFromDate:[NSDate date]];
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    CLLocation *loc = locations.lastObject;
    double Speed = loc.speed;
    
    if (0 < Speed && Speed <= 2.5){
        recoginze = @"Walking";
    } else if(2.5 < Speed){
        recoginze = @"Running";
    } else{
        recoginze = @"Still";
    }
    
  //lazy change the motion state
    if (![pre_recognize isEqualToString:recoginze]) {
        if ([pre_recognize isEqualToString:@"Walking"] && [recoginze isEqualToString:@"Running"]) {
            if (Speed <= 3.0) {
                recoginze = @"Walking";
                return;
            }
        } else if([pre_recognize isEqualToString:@"Running"] && [recoginze isEqualToString:@"Walking"]) {
            if (2.0 <= Speed) {
                recoginze = @"Running";
                return;
            }
        }
        //datestr->Speed for test my walking speed
      //  NSString *stringSpeed = [NSString stringWithFormat:@" %f",Speed];
        NSString* motion=[recoginze stringByAppendingString:datestr];
        [delegate.Motion addObject:motion];
        pre_recognize = recoginze;
    }
    NSLog(@"%f", Speed);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Motion = [[NSMutableArray alloc] init];
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locMgr requestWhenInUseAuthorization];
        self.locMgr.distanceFilter=10;
        self.locMgr.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
        [self.locMgr startUpdatingLocation];
    } else {
        NSLog(@"Location services are not enabled");
    }
    
    
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

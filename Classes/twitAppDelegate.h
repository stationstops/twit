//
//  twitAppDelegate.h
//  twit
//
//  Created by Chris Schoenfeld on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class twitViewController;

@interface twitAppDelegate : NSObject <UIApplicationDelegate> {
	
	UINavigationController *navController;
    UIWindow *window;
    twitViewController *viewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet twitViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end


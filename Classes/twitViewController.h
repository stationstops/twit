//
//  twitViewController.h
//  twit
//
//  Created by Chris Schoenfeld on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "twitAppDelegate.h"

@interface twitViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	twitAppDelegate *appDelegate;
	MPMoviePlayerController *myVideoPlayer;
	UILabel *lblStatus;
	UIActivityIndicatorView *busyBox;
	
}
@property (nonatomic, retain) MPMoviePlayerController *myVideoPlayer;
@property (nonatomic, retain) IBOutlet UILabel *lblStatus;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *busyBox;
@property (nonatomic, assign) twitAppDelegate *appDelegate;



-(void)insertPlayer;
-(void)loadURL;
-(NSString *)getLoadStateText:(NSInteger)intLoadState;
-(NSString *)getPlayStateText:(NSInteger)intPlayState;


@end


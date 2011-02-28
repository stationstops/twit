//
//  twitViewController.m
//  twit
//
//  Created by Chris Schoenfeld on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "twitViewController.h"
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "twitAppDelegate.h"
#import "TwitCell.h"

@implementation twitViewController
@synthesize myVideoPlayer;
@synthesize busyBox;
@synthesize lblStatus;
@synthesize appDelegate;

-(void)loadURL{
	
	NSURL *movieURL=[NSURL URLWithString:@"http://usher.justin.tv/stream/multi_playlist/twit.m3u"];
	[myVideoPlayer setContentURL:movieURL]; 
	
}	

-(void)updatePlayerStatus:(NSNotification*)notification{
	
	MPMoviePlayerController* thisPlayer=[notification object];
	
	NSLog(@"Status: %@ %@", [self getLoadStateText:thisPlayer.loadState],[self getPlayStateText:thisPlayer.playbackState]);	
	//labelSourceType.text=[self getSourceTypeText:thisPlayer.movieSourceType];	
//[self getPlayStateText:thisPlayer.playbackState];	
	//labelNaturalSize.text=[self getNaturalSizeText:thisPlayer.naturalSize];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Video player is only loaded here in code, not in nib
	
	appDelegate = (twitAppDelegate *)[[UIApplication sharedApplication] delegate];

	UIImage *image = [UIImage imageNamed:@"twitlogo.png"];
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
	[image release];
	
	
	self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
	self.title=@"TWiTPlayer";
	[self insertPlayer];
	
	[self loadURL];
	[myVideoPlayer play];
		
	
}


-(NSString *)getLoadStateText:(NSInteger)intLoadState{
	
	NSString *status;
	
	status=nil;
	
	//NSLog(@"Load state: %d", intLoadState);
	
	switch (intLoadState) {
			
		case MPMovieLoadStateUnknown:
			
			//status=@"Reported Unknown";
			
			break;
			
		case MPMovieLoadStatePlayable:			
			
			status=@"Playable";
			
			break;
			
		case MPMovieLoadStatePlaythroughOK:
			
			status=@"Play Through OK";
			break;
			
		case MPMovieLoadStateStalled:
			
			status=@"Stalled";
			break;
			
		default:
			
			//status=@"Undetermined";
			break;
	}
		
	return status;	
}

-(NSString *)getPlayStateText:(NSInteger)intPlayState{
	
	NSString *status;
	
	switch (intPlayState) {
		case MPMoviePlaybackStateStopped:
			status=@"Stopped";
			break;
		case MPMoviePlaybackStatePlaying:
			//[self setPlaybackInterval];
			status=@"Playing";
			lblStatus.hidden=YES;
			break;
		case MPMoviePlaybackStateInterrupted:
			status=@"Interrupted";
			break;
		case MPMoviePlaybackStatePaused:
			status=@"Paused";
			break;
		case MPMoviePlaybackStateSeekingForward:
			status=@"Seeking Forward";
			break;
		case MPMoviePlaybackStateSeekingBackward:
			status=@"Seeking Backward";
			break;
		default:
			status=@"Undetermine";
			break;
	}
	
	return status;
	
}

-(void)insertPlayer{
	
	myVideoPlayer=[[MPMoviePlayerController alloc] init];
	myVideoPlayer.controlStyle = MPMovieControlStyleDefault;
	myVideoPlayer.view.backgroundColor=[UIColor blackColor];
	myVideoPlayer.view.opaque=NO;
	myVideoPlayer.view.frame = CGRectMake(0, 0, 320, 200); 
	
	
	lblStatus=[[UILabel alloc] init];
	busyBox=[[UIActivityIndicatorView alloc] init];
	lblStatus.frame=CGRectMake(0, 100, 320, 20);
	
	lblStatus.textColor=[UIColor whiteColor];
	lblStatus.text=@"Loading...";
	lblStatus.backgroundColor=[UIColor clearColor];
	lblStatus.frame=CGRectMake(0, 80, 320, 20);
	lblStatus.textAlignment=UITextAlignmentCenter;
	
	/*
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(brandMoviePlayBackDidFinish:)
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:myVideoPlayer];
	
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updatePlayerStatus:)
												 name:MPMovieMediaTypesAvailableNotification
											   object:myVideoPlayer];
	
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updatePlayerStatus:)
												 name:MPMoviePlayerPlaybackStateDidChangeNotification
											   object:myVideoPlayer];
	
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updateStopwatch:)
												 name:MPMoviePlayerLoadStateDidChangeNotification
											   object:self];
	
	
	
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updatePlayerStatus:)
												 name:MPMoviePlayerLoadStateDidChangeNotification
											   object:myVideoPlayer];
	
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updatePlayerStatus:)
												 name:MPMovieNaturalSizeAvailableNotification
											   object:myVideoPlayer];
	*/
	[[NSNotificationCenter defaultCenter]	addObserver:self
											 selector:@selector(updatePlayerStatus:)
												 name:MPMoviePlayerLoadStateDidChangeNotification
											   object:myVideoPlayer];
	 
	
	
	[self.view addSubview:myVideoPlayer.view];
	[myVideoPlayer.view addSubview:lblStatus];
	
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSLog(@"loading");
	
	static NSString *TwitCellIdentifier = @"TwitCellIdentifier";
	
	TwitCell *cell = (TwitCell *)[tableView dequeueReusableCellWithIdentifier: TwitCellIdentifier];
	
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TwitCell"
													 owner:self options:nil];
		for (id oneObject in nib)
			if ([oneObject isKindOfClass:[TwitCell class]])
				cell = (TwitCell *)oneObject;
	}
	
	return cell;
	
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
	
	
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end

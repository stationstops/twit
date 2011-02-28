//
//  TwitCell.h
//  twit
//
//  Created by Chris Schoenfeld on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TwitCell : UITableViewCell {

	IBOutlet UILabel *lblName;
	IBOutlet UILabel *lblMsg;
}

@property (nonatomic, retain) IBOutlet UILabel *lblName;
@property (nonatomic, retain) IBOutlet UILabel *lblMsg;





@end

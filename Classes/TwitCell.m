//
//  TwitCell.m
//  twit
//
//  Created by Chris Schoenfeld on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitCell.h"


@implementation TwitCell

@synthesize lblName;
@synthesize lblMsg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end

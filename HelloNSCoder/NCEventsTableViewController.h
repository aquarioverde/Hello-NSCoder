//
//  NCEventsTableViewController.h
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NCEventLoader.h"

@class NCEventDetailViewController;

/**
 UITableViewController implementation for displaying a list of events
 Implements the NSEventLoaderDelegate protocol to receive notifications when the events have been loaded
 */
@interface NCEventsTableViewController : UITableViewController <NSEventLoaderDelegate>
{
}

/**
 Array containing the events to display
 */
@property (nonatomic, retain) NSMutableArray *events;

/**
 The event loader object
 */
@property (nonatomic, retain) NCEventLoader *eventLoader;

/**
 The detail view controller
 */
@property (nonatomic, retain) NCEventDetailViewController *detailViewController;

@end

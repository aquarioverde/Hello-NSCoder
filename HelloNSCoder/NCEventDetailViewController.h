//
//  NCEventDetailViewController.h
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NCEvent;


/**
 UIViewController implementation for displaying an event's details
 */
@interface NCEventDetailViewController : UIViewController {
    
}

/**
 The event this view will display
 */
@property (nonatomic, retain) NCEvent *event;

@property (nonatomic, retain) IBOutlet UILabel *shortDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *startDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionView;

@end

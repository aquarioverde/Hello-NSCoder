//
//  NCEventDetailViewController.m
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import "NCEventDetailViewController.h"
#import "NCEvent.h"
#import "NCConf.h"


@implementation NCEventDetailViewController

@synthesize scrollView;
@synthesize shortDescriptionLabel, startDateLabel,locationLabel, descriptionView, mapView;
@synthesize event;


#pragma mark - initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
}

#pragma mark - cleanup

- (void)dealloc
{
    self.event = nil;
    self.mapView = nil;
    self.descriptionView = nil;
    self.locationLabel = nil;
    self.startDateLabel = nil;
    self.shortDescriptionLabel = nil;
    self.scrollView = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 Set the current events data
 */
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = event.name;
    
    self.shortDescriptionLabel.text = event.shortDescription;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-mm-dd"];
    self.startDateLabel.text = [formatter stringFromDate:event.startDate];
    self.locationLabel.text = event.location;
    self.descriptionView.text = event.fullDescription;
    
    // apply fonts and font size to labels
    self.shortDescriptionLabel.font=[UIFont boldSystemFontOfSize:BIGFONT];
    self.descriptionView.font=[UIFont fontWithName:FONT size:MEDIUMFONT];
    self.locationLabel.font=[UIFont fontWithName:FONT size:MEDIUMFONT];
    self.startDateLabel.font=[UIFont fontWithName:FONT size:MEDIUMFONT];
    
    // ajust text view to size of text so no scrolling is needed in text view
    CGRect frame = descriptionView.frame;
    frame.size.height = descriptionView.contentSize.height;
    descriptionView.frame = frame;
    
    CGRect mapViewFrame = mapView.frame;
    mapViewFrame.origin.y = frame.origin.y + frame.size.height + 20;
    mapView.frame = mapViewFrame;
    
    scrollView.contentSize = CGSizeMake(320, mapViewFrame.origin.y + mapViewFrame.size.height + 20);
    
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

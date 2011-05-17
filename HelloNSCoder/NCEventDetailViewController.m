//
//  NCEventDetailViewController.m
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import "NCEventDetailViewController.h"
#import "NCEvent.h"


@implementation NCEventDetailViewController

@synthesize shortDescriptionLabel, startDateLabel,locationLabel, descriptionView;
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
    self.descriptionView = nil;
    self.locationLabel = nil;
    self.startDateLabel = nil;
    self.shortDescriptionLabel = nil;
    
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

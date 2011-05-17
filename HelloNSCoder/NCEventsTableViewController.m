//
//  NCEventsTableViewController.m
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import "NCEventsTableViewController.h"
#import "NCEvent.h"
#import "NCEventDetailViewController.h"


@implementation NCEventsTableViewController

@synthesize eventLoader, events;
@synthesize detailViewController;


#pragma mark - NSEventLoaderDelegate 

/**
 Called by NSEventLoader when has received all events
 Set the tables events array an reloads the table
 */
- (void)didFinishUpdatingData:(NSMutableArray *)newData
{
    self.events = newData;
    
    [self.tableView reloadData];
}

#pragma mark - initialization

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - cleanup

- (void)dealloc
{
    self.events = nil;
    self.eventLoader = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/**
 Call super viewDidLoad
 Initialize the event loader and initiate event load
 Initialize the events array to display an empty table view while loading events
 Set navigation item title
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!events) {
        self.events = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    }
    
    // implementing the eventloader in the tableview controller makes it necessary to implement the 
    // NSEventLoaderDelegate protocol!!!
    if (!eventLoader) {
        self.eventLoader = [[[NCEventLoader alloc] init] autorelease];
        eventLoader.delegate = self;
    }
    
    [eventLoader loadNearbyEvents];
    
    self.navigationItem.title = @"NSCoder Events";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

/**
 Return number of events
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [events count];
}

/**
 Create a table cell displaying the events icon, name and short description
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Get the selected event and configure the event cell
    NCEvent *event = [events objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"NSCoder_Icon.png"];
    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = event.shortDescription;
    
    return cell;
}


#pragma mark - Table view delegate

/** 
 Push event details view controller on the stack to display the selected event's details
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!detailViewController) {
        self.detailViewController = [[NCEventDetailViewController alloc] init];
    }
    
    NCEvent *event = [events objectAtIndex:indexPath.row];
    detailViewController.event = event;
    [event release];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end

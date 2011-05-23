//
//  NCEventLoader.m
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import "NCEventLoader.h"
#import "NCEvent.h"

@implementation NCEventLoader

@synthesize delegate;


/**
 Load events from a predefined pList
 */
- (void)loadNearbyEventsFromPList
{
    NSString *pathPlist=[[NSBundle mainBundle]pathForResource:@"dataEvents" ofType:@"plist"];
    
    NSMutableArray *eventsPlist=[[NSMutableArray alloc]initWithContentsOfFile:pathPlist];
    NSMutableArray *events = [[[NSMutableArray alloc] init] autorelease];
    
    for (int i=0; i<[eventsPlist count]; i++) {
        NSDictionary *dictEvent=[eventsPlist objectAtIndex:i];
        NCEvent *event = [[NCEvent alloc] initWithName:[dictEvent objectForKey:@"name"] startDate:[dictEvent objectForKey:@"startDate"] location:[dictEvent objectForKey:@"location"]];
        
        event.shortDescription = [dictEvent objectForKey:@"shortDescription"];
        event.fullDescription = [dictEvent objectForKey:@"fullDescription"];
        event.longitude = [[dictEvent objectForKey:@"longitude"] floatValue];
        event.latitude = [[dictEvent objectForKey:@"latitude"] floatValue];
        
        [events addObject:event];               
    }
    
    [delegate didFinishUpdatingData:events];
    
    [eventsPlist release];    
}

/**
 Load events by creating a simple array looping and numbering
 */
- (void)loadNearbyEventsFromLoop
{
    // load all events nearby
    NSMutableArray *events = [[[NSMutableArray alloc] init] autorelease];
    
    for (int i = 0; i < 7; i++) {
        NCEvent *event = [[NCEvent alloc] initWithName:[NSString stringWithFormat:@"Hello NSCoder %i", i] startDate:[NSDate date] location:@"CINC Barcelona"];        
        
        event.shortDescription = @"Introducción a la programación con iOS";
        event.fullDescription = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        
        [events addObject:event];
    }        
    
    [delegate didFinishUpdatingData:events];
}

- (void)loadNearbyEvents
{
    if (!delegate) 
        return;
    
    // load all events nearby
    [self loadNearbyEventsFromPList];
}


@end

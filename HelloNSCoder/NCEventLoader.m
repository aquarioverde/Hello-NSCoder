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


- (void)loadNearbyEvents
{
    if (!delegate) 
        return;
        
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

@end

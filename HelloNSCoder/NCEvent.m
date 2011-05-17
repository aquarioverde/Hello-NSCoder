//
//  NCEvent.m
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import "NCEvent.h"


@implementation NCEvent

@synthesize name, shortDescription, startDate, location, fullDescription;
@synthesize longitude, latitude;


#pragma mark - initialization

- (id)initWithName:(NSString *)eName startDate:(NSDate *)eStartDate location:(NSString *)eLocation
{
    self = [super init];
    
    if (self) {
        self.name = eName;
        self.startDate = eStartDate;
        self.location = eLocation;
    }
    
    return self;
}

#pragma mark - cleanup
- (void)dealloc
{
    self.fullDescription = nil;
    self.location = nil;
    self.startDate = nil;
    self.shortDescription = nil;
    self.name = nil;
    
    [super dealloc];
}

@end

//
//  NCEvent.h
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Simple lass defining the properties of an event
 */
@interface NCEvent : NSObject {

}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *fullDescription;
@property (assign) float longitude;
@property (assign) float latitude;

/**
 Initialize a new Event object with the specified parameters
 
 @param eName name of the event
 @param eStartDate date and time the event starts
 @param eLocation name of the location where the event happens
 */
- (id)initWithName:(NSString *)eName startDate:(NSDate *)eStartDate location:(NSString *)eLocation;

@end

//
//  NCEventLoader.h
//  HelloNSCoder
//
//  Created by aquarioverde on 5/16/11.
//  Copyright 2011 NSCoder_BCN. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Protocol defining the methods to implement to be able to retrive data
 */
@protocol NSEventLoaderDelegate <NSObject>

@required

- (void)didFinishUpdatingData:(NSMutableArray *)newData;

@end



/**
 Class for loading events
 */
@interface NCEventLoader : NSObject {
    
}

@property (nonatomic, assign) id <NSEventLoaderDelegate> delegate;

/**
 Load all events that are found nearby the devices current position
 */
- (void)loadNearbyEvents;

@end

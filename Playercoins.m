//
//  Playercoins.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/11/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Playercoins.h"

@implementation Playercoins

@synthesize integerplayercoins;

static Playercoins *sharedData = nil;

+(Playercoins*) sharedData
{
    //If our singleton instance has not been created (first time it is being accessed)
    if(sharedData == nil)
    {
        //create our singleton instance
        sharedData = [[Playercoins alloc] init];
        
         integerplayercoins = [.string intValue];
        //collections (Sets, Dictionaries, Arrays) must be initialized
        //Note: our class does not contain properties, only the instance does
        //self.arrayOfDataToBeStored is invalid
        sharedData.integerplayercoins.string = [[int alloc] init];
    }
    
    //if the singleton instance is already created, return it
    return sharedData;
}

@end

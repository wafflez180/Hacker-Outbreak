//
//  GameData.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 8/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameData.h"

@implementation GameData

static GameData *sharedData = nil;

+(GameData *)sharedData {
    if (sharedData == nil) {
        sharedData = [[GameData alloc] init];
        sharedData.tempRankChange;
    }
    return sharedData;
}

@end

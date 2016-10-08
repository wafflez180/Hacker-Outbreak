//
//  GameData.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 8/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import <Foundation/Foundation.h>

@interface GameData : NSObject

@property (nonatomic, assign) int tempRankChange;

+(GameData *)sharedData;


@end

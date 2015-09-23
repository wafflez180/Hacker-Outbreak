//
//  slotmachinehandleclass.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 8/14/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "slotmachinehandleclass.h"

@implementation slotmachinehandleclass{
    
}

-(void)didLoadFromCCB{
    [self.animationManager runAnimationsForSequenceNamed:@"slotmachinehandletimeline"];
}

-(void)animationstart{
    [self.animationManager runAnimationsForSequenceNamed:@"slotmachinehandletimeline"];
}

@end

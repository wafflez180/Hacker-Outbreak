//
//  distraction.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 8/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface distraction : CCNode

@property (nonatomic) NSString *CodeName;
@property (nonatomic) NSString* CodeValue;
@property (nonatomic) BOOL CodeInvis;

-(void)setinvison;
-(void)setinvisoff;
@end

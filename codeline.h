//
//  codeline1.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface codeline : CCNode

@property (nonatomic) NSString *CodeName;
@property (nonatomic) NSString* CodeValue;
@property (nonatomic) BOOL CodeInvis;

-(void)setinvison;
-(void)setinvisoff;
-(void)shrink;
-(void)preparetoshrink;
@end

//
//  codeline1.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface codeline1 : CCNode

@property (nonatomic, assign) NSString *CodeName;
@property (nonatomic, assign) int CoinValue;
@property (nonatomic, assign) BOOL Visible;
-(void)setCodelinevalue1:(int)codelinevalue1;
-(void)setCodelinestring1:(NSString *)codelinestring1;
-(void)setInvisiblility1:(BOOL)invisiblility1;
-(void)setpropertydefaultvalues;
@end

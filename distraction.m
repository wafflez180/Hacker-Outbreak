//
//  distraction.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 8/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "distraction.h"
#import "Gameplay.h"

@implementation distraction{
CCLabelTTF *_thecode;
CCLabelTTF *coinvalue;
CCNodeColor *invisible;
}

@synthesize CodeName;
@synthesize CodeValue;
@synthesize CodeInvis;

-(void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    // BELOW SETS THE PROPERTIES (assigned in spritebuilder) to the CHILDREN VARIABLES
    _thecode.string = CodeName;
    coinvalue.string = CodeValue;
    invisible.visible = CodeInvis;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    NSDictionary* userInfo = @{@"coinvalue": coinvalue.string,
                               @"codename": _thecode.string,
                               @"invisibleself": self
                               };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PurchasedDistraction" object:nil userInfo:userInfo];
}

-(void)setinvison{
    
    invisible.visible = FALSE;
}
-(void)setinvisoff{
    
    invisible.visible = TRUE;
}


@end

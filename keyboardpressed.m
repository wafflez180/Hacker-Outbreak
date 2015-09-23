//
//  keyboardpressed.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/23/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "keyboardpressed.h"
#import "keyboardbutton.h"
#import "Gameplay.h"

@implementation keyboardpressed{
    CCLabelTTF *theletterlabel;
    CCNodeColor *keyboardcolor;
    NSMutableArray *alphabet;
}

-(void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    self.visible = TRUE;
}
-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    self.visible = FALSE;
}
@end

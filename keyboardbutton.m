//
//  keyboardbutton.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "keyboardbutton.h"
#import "Gameplay.h"


@implementation keyboardbutton{
CCLabelTTF *theletterlabel;
CCNodeColor *keyboardcolor;
    NSMutableArray *alphabet;
    CCLabelBMFont *wadawd;
}

-(void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    NSString *tempstring = [self.lettervalue lowercaseString];
    
    NSDictionary* userInfo = @{@"theletter": tempstring,
                               @"pressing" : @"1"
                               };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeLetter" object:nil userInfo:userInfo];
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    NSString *tempstring = [self.lettervalue lowercaseString];
    
    NSDictionary* userInfo = @{@"theletter": tempstring,
                               @"pressing" : @"0"
                               };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeLetter" object:nil userInfo:userInfo];
}

-(void)buttonfeedback{
    
}

@end

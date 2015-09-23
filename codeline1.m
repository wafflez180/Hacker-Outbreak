//
//  codeline1.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "codeline1.h"

@implementation codeline1{
    CCLabelTTF *_thecode1;
    CCLabelTTF *coinvalue1;
    CCNodeColor *invisible1;
}

@synthesize CodeName;
@synthesize CoinValue;
@synthesize Visible;

-(void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //Check if touch is within the bounding box in shopping icon if so toggle bool to make sure
        NSLog(@"Player Purchased Codeline1");
        _thecode1.string = self.CodeName;
    NSMutableString *tempstring;
        [tempstring setString:[NSString stringWithFormat:@"%d", self.CoinValue]];
    coinvalue1.string = tempstring;
        invisible1.visible = !invisible1.visible;
}

-(void)setpropertydefaultvalues{
    _thecode1.string = self.CodeName;
    coinvalue1.string = [NSString stringWithFormat:@"%i", self.CoinValue];
    invisible1.visible = self.Visible;
    
}
-(void)setCodelinestring1:(NSString *)acodelinestring1{
    _thecode1.string = acodelinestring1;
}

-(void)setCodelinevalue1:(int)acodelinevalue1{
    NSString* myNewString = [NSString stringWithFormat:@"%i", acodelinevalue1];
    coinvalue1.string = myNewString;
}

-(void)setInvisiblility1:(BOOL)ainvisiblility1{
    invisible1.visible = ainvisiblility1;
}

@end

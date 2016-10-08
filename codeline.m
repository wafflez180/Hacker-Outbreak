//
//  codeline1.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "codeline.h"
#import "Gameplay.h"

@implementation codeline{
    CCLabelTTF *_thecode;
    CCLabelTTF *coinvalue;
    CCNodeColor *invisible;
    BOOL shrinking;
    CCLabelTTF *shrinkcountdown;
    CCSprite *shrinkcolor;
    int originalwidthofcolor;
    int countdown;
    int calculateddifference;
    int shrinkedwidthcalculated;
    CCNodeColor *bgcolorovertext;
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
    originalwidthofcolor = shrinkcolor.contentSizeInPoints.width;
    shrinking = FALSE;
    shrinkcolor.visible = FALSE;
    bgcolorovertext.visible = FALSE;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if (shrinking != TRUE && self.CodeInvis != NO) {
    NSDictionary* userInfo = @{@"coinvalue": coinvalue.string,
                               @"codename": _thecode.string,
                               @"invisibleself": self
                               };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PurchasedCodeline" object:nil userInfo:userInfo];
    
    }
}

-(void)preparetoshrink{
    shrinkcountdown.visible = TRUE;
    shrinking = TRUE;
    shrinkcolor.visible = TRUE;
    bgcolorovertext.visible = TRUE;
    
    shrinkedwidthcalculated = originalwidthofcolor;
    
    calculateddifference = 0;
    countdown = 0;
    
    CGSize shrinkedsize = CGSizeMake(67 ,shrinkcolor.contentSizeInPoints.height);
    [shrinkcolor setContentSizeInPoints:shrinkedsize];
    
    shrinkcountdown.string = @"60";
}

-(void)shrink{
    
    if (countdown == 60) {
        shrinkcolor.visible = FALSE;
        shrinking = FALSE;
        shrinkedwidthcalculated = originalwidthofcolor;
        bgcolorovertext.visible = FALSE;
    }else{
    
        shrinking = TRUE;    
        
    shrinkcountdown.string = [NSString stringWithFormat:@"%i", 60 - countdown];
    
    int decreaseby = originalwidthofcolor / 60;
    
    shrinkedwidthcalculated = shrinkedwidthcalculated - decreaseby;
    CGSize shrinkedsize = CGSizeMake(shrinkedwidthcalculated ,shrinkcolor.contentSizeInPoints.height);
    [shrinkcolor setContentSizeInPoints:shrinkedsize];
    
    countdown++;
    
    [self performSelector:@selector(shrink) withObject:nil afterDelay:1];
    }
}

-(void)setinvison{
    
    invisible.visible = FALSE;
}
-(void)setinvisoff{
    
    invisible.visible = TRUE;
}
-(void)dontcountdown{
    shrinkcolor.visible = FALSE;
    shrinking = FALSE;
    bgcolorovertext.visible = FALSE;
    countdown = 30;
    CGSize shrinkedsize = CGSizeMake(0 , 0);
    [shrinkcolor setContentSizeInPoints:shrinkedsize];
    shrinkcountdown.visible = FALSE;
    shrinkcountdown.string = @"";
    
}

@end

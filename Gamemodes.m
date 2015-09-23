//
//  Gamemodes.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/8/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gamemodes.h"
#import "MPCLobby.h"


@implementation Gamemodes{
    CCSprite *gobacktohomepage;
    CCButton *OneVSOneButton;
    int clickonetime;
    CCNodeColor *loadingspinner;
}

-(void)didLoadFromCCB{
        NSLog(@"Gamemodes Scene Loaded");
    self.userInteractionEnabled = TRUE;
    clickonetime = 0;
    loadingspinner.visible = FALSE;
}

- (void)OneVSOneButton{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                loadingspinner.visible = TRUE;
            });
    });
    
        [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    if (clickonetime == 0) {
        
    [OneVSOneButton setEnabled:FALSE];
    NSLog(@"1 vs 1 Button Pressed");
    CCScene *Gameplay = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector]replaceScene:Gameplay];
        clickonetime++;
    }
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInWorld];
    
    if (CGRectContainsPoint([gobacktohomepage boundingBox], touchLocation)) {
        CCScene *MainScene = [CCBReader loadAsScene:@"MainScene"];
        [[CCDirector sharedDirector]replaceScene:MainScene];
    }
}

@end

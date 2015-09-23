//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "MPCLobby.h"
#import "Gameplay.h"
#include <OALSimpleAudio.h>
#import <Crashlytics/Crashlytics.h>

@implementation MainScene{

    CCLabelTTF *playerhasdisconnectedlabel;
    BOOL disconnected;
    CCLabelTTF *hackerranklabel;
    CCSprite *playbutton;
    CCSprite *bgstrip1;
    CCSprite *bgstrip2;
    CCSprite *bgstrip3;
    CGPoint originalSlotStrip1Position;
    CGPoint originalSlotStrip2Position;
    CGPoint originalSlotStrip3Position;
    CCSprite *tempbg;
    CCLabelTTF *rankclassname;
    CCSprite *share;
    CCSprite *playbuttonbg;
    CCSprite *OneVSOneButton;
    int clickonetime;
    CCNodeColor *loadingspinner;
    CCNode *gamemodescontainer;
    BOOL gamemodesscene;
        BOOL clicked1;
        BOOL clicked2;
    CCScene *GameplayScene;
    CCSprite *rankcontainer;
    bool ranksopen;
    CCSprite *doublearrowstab;
    BOOL cantclickpower;
}

-(void)didLoadFromCCB{
    
    Gameplay *gameplayobject = [[Gameplay alloc]init];
    [gameplayobject.lobby thedisconnectmethodnomain];
    
    self.userInteractionEnabled = YES;
    
    gamemodescontainer.position = ccp(1.50, .50);
    
    gamemodesscene = FALSE;
    
    clicked1 = FALSE;
    clicked2 = FALSE;
    cantclickpower = FALSE;
    
    share.visible = TRUE;
    
    ranksopen = FALSE;
    
    [self preloadassets];
    
    OneVSOneButton.color = [CCColor whiteColor];
    playbutton.opacity = 1;
    
    GameplayScene = [CCBReader loadAsScene:@"Gameplay"];

    
    NSString *rank    = @"0";
    NSDate *lastRead    = (NSDate *)[[NSUserDefaults standardUserDefaults] objectForKey:rank];
    if (lastRead == nil)     // App first run: set up user defaults.
    {
        NSDictionary *appDefaults  = [NSDictionary dictionaryWithObjectsAndKeys:[NSDate date], rank, nil];
        
        // do any other initialization you want to do here - e.g. the starting default values.
        // [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"should_play_sounds"];
        
        [MGWU setObject:[NSNumber numberWithBool:YES] forKey:@"sound"];
        [MGWU setObject:[NSNumber numberWithInt:0] forKey:@"hackerrank"];
        
        // sync the defaults to disk
        [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:rank];
    
//    [[CCDirector sharedDirector]setDisplayStats:YES];
    
    playerhasdisconnectedlabel.visible = FALSE;
    if (disconnected) {
        playerhasdisconnectedlabel.visible = TRUE;
        disconnected = false;
        
    }
    NSLog(@"MainScene Scene Loaded");
    
    int temprank = [[MGWU objectForKey:@"hackerrank"] intValue];
    hackerranklabel.string = [NSString stringWithFormat:@"Rank: %i", temprank];
    [MGWU setReminderMessage:@"Come back and invite your friends to play Hacker Outbreak!"];
    
    if (temprank < 50) {
        rankclassname.string = @"Noobie";
    }
    if (temprank > 50) {
        rankclassname.string = @"High School Hacker";
    }

    if (temprank > 100) {
        rankclassname.string = @"Pro";
    }

    if (temprank > 200) {
        rankclassname.string = @"Black Hat";
    }

    if (temprank > 500) {
        rankclassname.string = @"Night Dragon";
    }
    if (temprank > 1000) {
        rankclassname.string = @"Elite";
    }
    if (temprank > 5000) {
        rankclassname.string = @"GOD";
    }
    if (temprank > 9001) {
        rankclassname.string = @"SUPER SAIYAN!!!";
    }
}

- (void)playbutton {
    [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    NSLog(@"Playbutton Pressed");
    
    [self.animationManager setPaused:TRUE];
    
        OneVSOneButton.color = [CCColor whiteColor];
    
    [playbutton runAction:[CCActionFadeOut actionWithDuration:.25]];
    [playbuttonbg runAction:[CCActionFadeOut actionWithDuration:.25]];
    
    id comeintoofar = [CCActionMoveTo actionWithDuration:0.50 position:ccp(.40,.50)];
    id fixpositon = [CCActionMoveTo actionWithDuration:0.15 position:ccp(.50,.50)];
    
    [gamemodescontainer runAction: [CCActionSequence actions: comeintoofar, fixpositon, nil]];
    
    cantclickpower = TRUE;
    
    [self performSelector:@selector(gamemodessetTrue) withObject:nil afterDelay: 0.64];
}

-(void)gamemodessetTrue{
    gamemodesscene = TRUE;
}

-(void)disconnected{
    disconnected = TRUE;
    [self didLoadFromCCB];
}

-(void)share{
        [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    [MGWU canInviteFriends];
    
    if ([MGWU isTwitterActive]){
        [MGWU inviteFriendsWithMessage:@"Checkout Hacker Outbreak and Play With Me!"];
    }
    
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
       CGPoint touchLocation = [touch locationInNode:self];
    
        if (!ranksopen && rankcontainer.position.y == 90) {
    if (CGRectContainsPoint([playbutton boundingBox], touchLocation) && cantclickpower == FALSE) {
        playbutton.opacity = 0.75;
    }
    if (CGRectContainsPoint([share boundingBox], touchLocation)) {
        share.color = [CCColor grayColor];
    }
    
    if (CGRectContainsPoint([OneVSOneButton boundingBox], touchLocation)) {
        OneVSOneButton.color = [CCColor grayColor];
    }
        }
    if(CGRectContainsPoint([rankcontainer boundingBox], touchLocation)){
        if (ranksopen == TRUE && rankcontainer.position.y == 360.0){
            [rankcontainer runAction:[CCActionMoveTo actionWithDuration:.25 position:ccp(0.5, 90)]];
            ranksopen = FALSE;
            doublearrowstab.rotation = 0;
        }
        if (ranksopen == FALSE && rankcontainer.position.y == 90){
            [rankcontainer runAction:[CCActionMoveTo actionWithDuration:.25 position:ccp(0.5, 360.0)]];
            ranksopen = TRUE;
            doublearrowstab.rotation = 180;
        }
    }
    
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if (!ranksopen && rankcontainer.position.y == 90) {
    
    OneVSOneButton.color = [CCColor whiteColor];
    share.color = [CCColor whiteColor];
    
    
           CGPoint touchLocation = [touch locationInNode:self];
    if (CGRectContainsPoint([OneVSOneButton boundingBox], touchLocation)) {
        if (gamemodesscene && clicked2 != TRUE) {
            [self OneVSOneButton];
            clicked2 = TRUE;
                    OneVSOneButton.color = [CCColor whiteColor];
        }
    }
    
    if (CGRectContainsPoint([share boundingBox], touchLocation)) {
        [self share];
        share.color = [CCColor whiteColor];
    }
    if (CGRectContainsPoint([playbutton boundingBox], touchLocation) && cantclickpower == FALSE) {
        if(cantclickpower == false){
        playbutton.opacity = 1;
        }

            cantclickpower = TRUE;
        
        if (gamemodesscene == TRUE || clicked1) {
            
        }else{
            
            clicked1 = TRUE;
            
            [self performSelector:@selector(playbutton) withObject:nil afterDelay: .95];
            
            [self.animationManager runAnimationsForSequenceNamed:@"ButtonTimeline"];
        }
        
    }
    }
}

-(void)spinspinner{
    tempbg.visible = TRUE;
    [tempbg runAction:[CCActionRotateBy actionWithDuration:30 angle:5080]];
}

- (void)OneVSOneButton{
    
    [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    if (clickonetime == 0) {
        
        NSLog(@"1 vs 1 Button Pressed");
        
        [[CCDirector sharedDirector]replaceScene:GameplayScene];
        clickonetime++;
    }
}

-(void)preloadassets{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"static-1.png"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"static-2.png"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"static-3.png"];
    
}

-(void)PressedTwitter{
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/HackerOutbreak"]];
}

-(void)PressedFacebook{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.facebook.com/HackerOutbreak"]];
}

@end

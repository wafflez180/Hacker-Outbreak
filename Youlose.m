//
//  Youlose.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Youlose.h"
#import "MPCLobby.h"
#import "GameData.h"


@implementation Youlose{
    CCButton *gobackbutton;
    int clickonetime;
    CCButton *rematchButton;
    CCLabelTTF *rankclassname;
    CCLabelTTF *hackerranklabel;
    CCLabelTTF *RankChange;
}
-(void)didLoadFromCCB{
    clickonetime = 0;
    int temprank = [[MGWU objectForKey:@"hackerrank"] intValue];
    hackerranklabel.string = [NSString stringWithFormat:@"Rank: %i", temprank];
    
    [UIApplication sharedApplication].idleTimerDisabled = NO;
    
    RankChange.string = [NSString stringWithFormat:@"%i", [GameData sharedData].tempRankChange];
    
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
}

-(void)updatestring{
    RankChange.string = [NSString stringWithFormat:@"%i", [GameData sharedData].tempRankChange];
}

- (void)gobacktomainlost{
    NSLog(@"Went back to homepage. Player ||LOST!||");
    CCScene *MainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:MainScene];
//    [MGWU setAppiraterAppId:appid andAppName:appname];
}

- (void)rematch{
    if (clickonetime == 0) {
        [rematchButton setEnabled:FALSE];
        NSLog(@"Rematch Button Pressed by Loser");
        CCScene *Gameplay = [CCBReader loadAsScene:@"Gameplay"];
        [[CCDirector sharedDirector]replaceScene:Gameplay];
        clickonetime++;
    }
}
@end

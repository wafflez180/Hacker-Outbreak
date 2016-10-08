//
//  Gameplay.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "MPCLobby.h"
#import "codeline.h"
#import <UIKit/UIKit.h>

@class MPCLobby;

@interface Gameplay : CCScene

@property MPCLobby* lobby;
@property NSString* Playercoins;
@property NSMutableArray* CodeNamesArray;
@property NSMutableArray* DistractionNamesArray;
@property NSMutableArray* Codelistvalues;
@property BOOL countdown;
@property int coinspertime;
@property int whengivecoins;
@property NSString* thecodereturnvalue;
@property bool isconnectedtopeer;
@property bool onetaponlyregulator;
@property NSString* distractionstring;
@property NSString* currentmessage;

@end

//
//  Gameplay.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "codeline.h"
#import "keyboardbutton.h"
#import "MPCLobby.h"
#import "MainScene.h"
#import "Gamemodes.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "joinandhost.h"
#import "GameData.h"
#import "slotmachinehandleclass.h"
#import "Youwin.h"
#import "Youlose.h"
#include <OALSimpleAudio.h>


static int lifecounter = 3;
static float thetempint = 0;

@implementation Gameplay{
    CCNode *thejoinandhostcontainer;
    CCLabelTTF *showcoinschangelabel;
    CCButton *deletebuttonarea;
    NSTimer *timer;
    CCLabelTTF *Livescounterlabel;
    CCSprite *wifi1;
    CCSprite *wifi2;
    CCSprite *wifi3;
    CCLabelTTF *attackdefendtextfieldvar;
    CCSprite *shoppingcart;
    CCNodeColor *shoppingcartvisibilty;
    CCNode *store;
    CCNode *maingameplaynode;
    CCNode *gameplay;
    BOOL dragging;
    float previoustouch;
    CCSprite *barframe1;
    CCSprite *barframe2;
    CCSprite *barframe3;
    BOOL thebool;
    float middleofcart;
    NSString *lettervalue;
    NSMutableString *textfieldstring;
    NSString *temppreviouscoins;
    int tempcoins;
    int thecoins;
    NSMutableString *theplayerscoinsstring;
    NSMutableString *tempmutablestring;
    CCSprite *hostButton;
    CCSprite *joinButton;
    CCLabelTTF *chathistory;
    CCLabelTTF *thetextfield;
    NSMutableString *thechathistorystring;
    CCLabelTTF *findinghostlabel;
    CCLabelTTF *findingplayerslabel;
    CCSprite *waitinggifjoin;
    CCSprite *waitinggifhost;
    CCNode *joinbuttoncontainer;
    CCNode *hostbuttoncontainer;
    CCNodeColor *findgamecontainer;
    CCNode *_listofcode;
    CCNode *playercoinscontainer;
    BOOL storebool;
    CGPoint originallocation;
    CCNodeColor *storecolor;
    CCLabelTTF *_theplayerscoins;
    CCNodeColor *wrongcodeindicator;
    CCLabelTTF *defendcounter;
    BOOL abletotaptodefend;
    CCLabelTTF *tapitlabel;
    CCScrollView *scrollviewoflist;
    NSString *thevalueofcode;
    bool didwin;
    bool didlose;
    CCLabelTTF *thetextfieldplaceholder;
    codeline *current;
    CCLabelTTF *cantbuymorethanonelabellabel;
    NSUInteger ltemp;
    CCColor *originalcolor;
    CCNodeColor *cantbuymorethanonelabelcolor;
    keyboardbutton *theletterlabel;
    BOOL textiswrong;
    BOOL deletespace;
    NSMutableString *sendingtempstring;
    CCLabelTTF *thepeeridlabel;
    CCSprite *oneenemylives;
        CCSprite *twoenemylives;
        CCSprite *threeenemylives;
    NSString *peerID;
    CCSprite *spacebutton;
    CCSprite *sendButton;
    BOOL running;
    CCLabelTTF *warninglabel;
        CCSprite *qpressed;
        CCSprite *wpressed;
        CCSprite *epressed;
        CCSprite *rpressed;
        CCSprite *tpressed;
        CCSprite *ypressed;
        CCSprite *upressed;
        CCSprite *ipressed;
        CCSprite *opressed;
        CCSprite *ppressed;
        CCSprite *apressed;
        CCSprite *spressed;
        CCSprite *dpressed;
        CCSprite *fpressed;
        CCSprite *gpressed;
        CCSprite *hpressed;
        CCSprite *jpressed;
        CCSprite *kpressed;
        CCSprite *lpressed;
        CCSprite *zpressed;
        CCSprite *xpressed;
        CCSprite *cpressed;
        CCSprite *vpressed;
        CCSprite *bpressed;
        CCSprite *npressed;
        CCSprite *mpressed;
    CCNodeColor *spacepressed;
    CCNodeColor *sendpressed;
    BOOL spacebuttonpressed;
    BOOL sendbuttonpressed;
    CCNode *backgroundred;
    CCNode *backgroundblue;
    CCNodeColor *topheaderblue;
    CCNodeColor *topheaderred;
    BOOL defending;
    float countdowntime;
    float overallgametime;
    int gamelength;
    bool rightletter;
    bool sending;
    bool opponentplayerisdefending;
    NSString *thetemperatestring;
    CCSprite *sendready1;
    CCSprite *animatingbutton;
    OALSimpleAudio *audio;
    CCSprite *soundon;
    CCSprite *soundmuted;
    CCSprite *gobacktogamemodes;
    CCNode *findbuggame;
    CCNode *thereddot1;
    CCNode *thereddot2;
    CCNode *thereddot3;
    BOOL playingbuggame;
    CCNode *radar;
    CGPoint originalpointofcountdown;
    int howmanytimesattacked;
    BOOL pressing;
    NSString *thePreviousString;
    CCSprite *oppdefending;
    CCLabelTTF *stagesLabel;
    CCSprite *fatmandistraction;
    CCSprite *spiderdistraction;
    CCSprite *hotdogdistraction;
    CCSprite *solderdistraction;
    CCSprite *spaceshipdistraction;
    CCNode *slotstrip1;
    CCNode *slotstrip2;
    CCNode *slotmachine;
    CGPoint originalSlotStrip1Position;
    CGPoint originalSlotStrip2Position;
    CCSprite *choice1;
    CCSprite *choice2;
    CCSprite *choice3;
    CCSprite *choice4;
    CCSprite *choice5;
    CGPoint  choice1position;
    CGPoint  choice2position;
    CGPoint  choice3position;
    CGPoint  choice4position;
    CGPoint  choice5position;
    CCSprite *teleporterimage;
    int blinkcounter;
    CCSprite *textfieldteleporter;
    CCLabelTTF *thetextfieldanimationcopy;
    CCSprite *theteleporterglow;
    CCNodeColor *textfieldteleportercover;
    CCSprite *playerDisonnectedPopup;
    CCSprite *pressedhome;
    CCNodeColor *gameplaybluecover;
    BOOL sendingdistraction;
    BOOL oneclick1;
    BOOL oneclick2;
    CCNodeColor *joinandhostbgcolor;
    CCNode *learninglabels;
    CCSprite *phoneconnectinganimation;
    CCNodeColor *dimmerfordisconnectedpanel;
    CCSprite *themissioncontainer;
    CCSprite *radarbg;
    CCSprite *gettingAttackedWarning;
    CCSprite *showStages;
    CCNodeColor *taptheviruslabel;
    bool oneclickonly;
    int showbugs;
    CCNode *bluetoothAndWifiLabels;
    CCLabelTTF *startgamecountdown;
    CCNode *toplearninglabels;
    CCLabelTTF *learninglabel1;
    CCLabelTTF *learninglabel2;
    CCLabelTTF *learninglabel3;
    CCSprite *findingphonewaiter;
    int typed_wrong_letter;
    int typed_right_letter;
    int pressed_space;
    slotmachinehandleclass *slotmachinestableanimation;
    CCSprite *slotmachinestable;
    CCNodeColor *oppdefendingcounter;
    int originaloppdefendingcounterwidth;
    int shrinkedwidthcalculated;
    int oppdefendingcountdown;
    int opponent_lost_life;
    int lost_life;
    int recieved_distraction;
    int recieved_attack;
    int connected_to_game;
    int pressed_to_connect_to_game;
    int sent_distraction;
    int sent_attack;
    int pressed_delete;
    int defended_attack;
    int bought_attack;
    int not_enough_coins_to_buy_attack;
    int already_have_onecodeline_bought;
    CCNode *typeindicators;
    CCNode *redtypearrows;
    CCNode *highlighted_delete;
    bool cantypeletter;
}


 // FOR BLUETOOTH INCOMING NOTIFICATIONS v

@synthesize lobby =             _lobby;
@synthesize Playercoins;


 // Handles what to do with BLUETOOTH INCOMING NOTIFICATIONS Data v
- (void)handleReceivedDataWithNotification:(NSNotification *)notification
{
    NSDictionary* userInfoDict = [notification userInfo];
    
    NSData* receivedData = [userInfoDict objectForKey:@"data"];
    //NSString* message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    NSArray *themessage = [NSKeyedUnarchiver unarchiveObjectWithData:receivedData];
    
    NSString *message = themessage[0];
    NSString *thecodereturnvalue = themessage[1];
    NSString *opponentisdefending = themessage[2];
    
    if(message.length > 0 && thecodereturnvalue.length == 1 && [message  isEqual: @"distraction"]){
        
        pressing = FALSE;
        
        if (defending) {
        
            recieved_distraction++;
            
        if([thecodereturnvalue isEqualToString:@"1"]){
            fatmandistraction.positionInPoints = ccp(maingameplaynode.contentSizeInPoints.width * -1, maingameplaynode.contentSizeInPoints.height / 2);
        
            [fatmandistraction runAction:[CCActionMoveTo actionWithDuration:7.f
                position:ccp(fatmandistraction.positionInPoints.x + maingameplaynode.contentSizeInPoints.width * 3, fatmandistraction.positionInPoints.y / 2)]];
        }
        if([thecodereturnvalue isEqualToString:@"2"]){
            hotdogdistraction.positionInPoints = ccp(maingameplaynode.contentSizeInPoints.width * -1, maingameplaynode.contentSizeInPoints.height / 2);
            
            [hotdogdistraction runAction:[CCActionMoveTo actionWithDuration:7.f
                                                                   position:ccp(hotdogdistraction.positionInPoints.x + maingameplaynode.contentSizeInPoints.width * 3, hotdogdistraction.positionInPoints.y / 2)]];
        }
        if([thecodereturnvalue isEqualToString:@"3"]){
            spiderdistraction.positionInPoints = ccp(maingameplaynode.contentSizeInPoints.width * -1, maingameplaynode.contentSizeInPoints.height / 2);
            
            [spiderdistraction runAction:[CCActionMoveTo actionWithDuration:7.f
                                                                   position:ccp(spiderdistraction.positionInPoints.x + maingameplaynode.contentSizeInPoints.width * 3, spiderdistraction.positionInPoints.y / 2)]];
        }
        if([thecodereturnvalue isEqualToString:@"4"]){
            spaceshipdistraction.positionInPoints = ccp(maingameplaynode.contentSizeInPoints.width * -1, maingameplaynode.contentSizeInPoints.height / 2);
            
            [spaceshipdistraction runAction:[CCActionMoveTo actionWithDuration:7.f
                                                                   position:ccp(spaceshipdistraction.positionInPoints.x + maingameplaynode.contentSizeInPoints.width * 3, spaceshipdistraction.positionInPoints.y / 2)]];
        }
        if([thecodereturnvalue isEqualToString:@"5"]){
            solderdistraction.positionInPoints = ccp(maingameplaynode.contentSizeInPoints.width * -1, maingameplaynode.contentSizeInPoints.height / 2);
            
            [solderdistraction runAction:[CCActionMoveTo actionWithDuration:7.f
                                                                   position:ccp(solderdistraction.positionInPoints.x + maingameplaynode.contentSizeInPoints.width * 3, solderdistraction.positionInPoints.y / 2)]];
        }
        }else{
            
        }
    }else{
    
    if (thecodereturnvalue.length > 0) {
        
    NSLog(@"The code value if defended is: %@", thecodereturnvalue);
        
    self.thecodereturnvalue = thecodereturnvalue;
    }
    
    MCPeerID* senderPeerID = [userInfoDict objectForKey:@"peerID"];
    NSString* senderDisplayName = senderPeerID.displayName;
    
    thepeeridlabel.string = senderDisplayName;
    
    if ([message rangeOfString:@"_PlayerSuccessfullyHacked_"].location != NSNotFound) {
        didwin = TRUE;
        NSLog(@"You Hacked your opponent");
        
        // AFTER YOU SEND MESSAGE ABOUT YOUR RANK
        
        int temprank = [[MGWU objectForKey:@"hackerrank"] intValue];
        NSString *temprankstring = [NSString stringWithFormat:@"%i", temprank];
        
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"lose", temprankstring, @"",nil];
        NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
        NSError* error;
        
        [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
    }
    
    if ([message isEqualToString:@"lose"]) {
        
        int YourTempRank = [[MGWU objectForKey:@"hackerrank"] intValue];
        NSString *temprankstring = [NSString stringWithFormat:@"%i", YourTempRank];
        
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"win", temprankstring, @"",nil];
        NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
        NSError* error;
        
        [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
        // AFTER YOU SEND MESSAGE ABOUT YOUR RANK SET YOUR OWN RANK
        
        NSString *theopponentshackerrank = thecodereturnvalue;
        
        int theOpponentsTempRank = [theopponentshackerrank intValue];
        
        int giveyouself;
        
        if (YourTempRank == 0) {
            giveyouself = 0;
        }else{
            giveyouself = theOpponentsTempRank - YourTempRank;
            if (giveyouself < 0) {
                giveyouself = giveyouself * -1;
            }
        }
        
        giveyouself = 16 * (-1 + 1/2*giveyouself/200);
        
        int randomselected = arc4random_uniform(5);
        
        giveyouself = giveyouself - randomselected;
        
        int yourfinalrank = YourTempRank + giveyouself;
        
        if (yourfinalrank < 0) {
            yourfinalrank = 0;
        }
        
        [GameData sharedData].tempRankChange = giveyouself;
        
        [MGWU setObject:[NSNumber numberWithInt:yourfinalrank] forKey:@"hackerrank"];
        
        [self performSelector:@selector(performlose) withObject:nil afterDelay:0.0];
    }
    if ([message isEqualToString:@"win"]) {
        
        int temprank = [[MGWU objectForKey:@"hackerrank"] intValue];
        
        NSString *thehackerrank = thecodereturnvalue;
        
        int thetemprank = [thehackerrank intValue];
        
        int giveyouself;
        
        if (temprank == 0) {
            giveyouself = 0;
        }else{
            giveyouself = thetemprank - temprank;
            if (giveyouself < 0) {
                giveyouself = giveyouself * -1;
            }
        }
        
        giveyouself = 16 * (1 + 1/2*giveyouself/200);
        
        int randomselected = arc4random_uniform(5);
        
        giveyouself = giveyouself + randomselected;
        
        int yourfinalrank = temprank + giveyouself;
        
        [GameData sharedData].tempRankChange = giveyouself;
        
        [MGWU setObject:[NSNumber numberWithInt:yourfinalrank] forKey:@"hackerrank"];
        
        [self performSelector:@selector(performwin) withObject:nil afterDelay:0.0];
    }
    
    
    if ([thecodereturnvalue rangeOfString:@"::2::"].location != NSNotFound) {
        NSLog(@"Opponent Player has 2 lives!");
        
        threeenemylives.color = [CCColor redColor];
        
        id blinkfastout = [CCActionFadeOut actionWithDuration:.5];
        
        id blinkfastin = [CCActionFadeIn actionWithDuration:.5];
        
        id blinkslowout = [CCActionFadeOut actionWithDuration:2];
        
        [threeenemylives runAction:[CCActionSequence actions: blinkfastout, blinkfastin, blinkslowout, nil]];
        
        opponent_lost_life++;
    }
    if ([thecodereturnvalue rangeOfString:@"::1::"].location != NSNotFound) {
        NSLog(@"Opponent Player has 1 life left!");
        twoenemylives.color = [CCColor redColor];
        
        id blinkfastout = [CCActionFadeOut actionWithDuration:.5];
        
        id blinkfastin = [CCActionFadeIn actionWithDuration:.5];
        
        id blinkslowout = [CCActionFadeOut actionWithDuration:2];
        
        [twoenemylives runAction:[CCActionSequence actions: blinkfastout, blinkfastin, blinkslowout, nil]];
        
        oneenemylives.color = [CCColor redColor];
        opponent_lost_life++;
    }
    
    if ([opponentisdefending isEqual: @"YES"]) {
        opponentplayerisdefending = TRUE;
        [self preparetoshrink];
            slotstrip1.visible = FALSE;
            slotstrip2.visible = FALSE;
        
                if (defending == FALSE) {
                    
        [slotmachine runAction:[CCActionScaleTo actionWithDuration:2 scale:1.3]];
                    
                }
        [self performSelector:@selector(turnslotsstripsvisible) withObject:nil afterDelay:2];
    }
    if ([opponentisdefending isEqual: @"NO"]) {
        opponentplayerisdefending = FALSE;
        
            [slotmachine runAction:[CCActionScaleTo actionWithDuration:2 scale:0]];
        
        [self performSelector:@selector(turnslotsstripsinvisible) withObject:nil afterDelay:0];
    }
    
        NSLog(@"Data: ||%@|| is recieved by %@", message, senderDisplayName);
    
        if (sending) {
            sleep(3);
        }
    
    if([message isEqual: @""]){
    }else{
        
        NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: message, @"Attack Name", nil];
        [MGWU logEvent:@"received_attack" withParams:params];
        recieved_attack++;
        
        gettingAttackedWarning.visible = TRUE;
        
        [self performSelector:@selector(turnwarningnotvisible) withObject:nil afterDelay:0.40];
            thetextfield.string = @"";
            [textfieldstring setString:@""];
            thetextfieldplaceholder.string = @"";
            self.countdown = TRUE;
            [self initiatecountdown];
        chathistory.string = @"";
        chathistory.string = message;
        
        NSString *tempmessage = [message lowercaseString];
        self.currentmessage = tempmessage;
            thetextfieldplaceholder.string = tempmessage;
        playingbuggame = TRUE;
        blinkcounter = 0;
        howmanytimesattacked++;
        if (tempmessage.length <= 22) {
            showbugs = 1;
            thereddot1.visible = TRUE;
            thereddot2.visible = FALSE;
            thereddot3.visible = FALSE;
        }
        if (tempmessage.length > 22 && tempmessage.length <= 30) {
            showbugs = 2;
            thereddot1.visible = TRUE;
            thereddot2.visible = TRUE;
            thereddot3.visible = FALSE;
        }
        if (tempmessage.length > 30) {
            showbugs = 3;
            thereddot1.visible = TRUE;
            thereddot2.visible = TRUE;
            thereddot3.visible = TRUE;
        }
        [self findbuggame];
        if(gameplay.position.x != 0){
            [gameplay runAction:[CCActionMoveTo actionWithDuration:0.35f position:ccp(0,gameplay.position.y)]];
        }
            NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"YES", nil];
            NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
            
            NSError* error;
            
            [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        }
    }
}
-(void)startgamecountdown{
    startgamecountdown.string = @"3";
    startgamecountdown.visible = TRUE;
    [self performSelector:@selector(nextnumber2) withObject:nil afterDelay:1];
}
-(void)nextnumber2{
    startgamecountdown.string = @"2";
    startgamecountdown.visible = TRUE;
    [self performSelector:@selector(nextnumber3) withObject:nil afterDelay:1];
}
-(void)nextnumber3{
    startgamecountdown.string = @"1";
    startgamecountdown.visible = TRUE;
    [self performSelector:@selector(startthegamecountdown) withObject:nil afterDelay:1];
}
-(void)startthegamecountdown{
    startgamecountdown.string = @"START!";
    startgamecountdown.visible = TRUE;
    
    running = TRUE;
    
    [startgamecountdown runAction:[CCActionFadeOut actionWithDuration:1.25]];
}

- (void)peerChangedStateWithNotification:(NSNotification *)notification
{
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    if (state == MCSessionStateNotConnected && !didwin & !didlose){
        // [myTimer invalidate]
        running = FALSE;
        playerDisonnectedPopup.userInteractionEnabled = TRUE;
        pressedhome.userInteractionEnabled = TRUE;
        playerDisonnectedPopup.visible = TRUE;
        gameplaybluecover.visible = YES;
        gameplay.position = ccp(0,0);
    }
    
    if (state == MCSessionStateConnected) {
        NSLog(@"Player is now connected");
        
        connected_to_game++;
        
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"", nil];
        NSData* sendPeerID = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
        NSError* error;
        
        [self.lobby.session sendData:sendPeerID toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
        findingplayerslabel.string = @"Connected";
        findinghostlabel.string = @"Connected";
        
        [thejoinandhostcontainer runAction:[CCActionMoveTo actionWithDuration:0.00f position:ccp(0, 300)]];
        [gameplay runAction:[CCActionMoveTo actionWithDuration:0 position:ccp(0, 0)]];
        [thejoinandhostcontainer runAction:[CCActionFadeOut actionWithDuration:1.00f]];
        [findinghostlabel runAction:[CCActionFadeOut actionWithDuration:1.00f]];
        [findingplayerslabel runAction:[CCActionFadeOut actionWithDuration:1.00f]];
        
        [self startgamecountdown];
    }
}

-(void)turnslotsstripsvisible{
    slotstrip1.visible = TRUE;
    slotstrip2.visible = TRUE;
}

-(void)turnslotsstripsinvisible{
    slotstrip1.visible = FALSE;
    slotstrip2.visible = FALSE;
}

-(void)peerIsConnecting{
    findingplayerslabel.string = @"Connecting";
    findinghostlabel.string = @"Connecting";
    
        phoneconnectinganimation.visible = TRUE;
    
    findingphonewaiter.visible = FALSE;
    
    pressed_to_connect_to_game++;
    
}

-(void)turnwarningnotvisible{
    gettingAttackedWarning.visible = FALSE;
}

-(void)didLoadFromCCB{
    thejoinandhostcontainer.visible = TRUE;
    audio = [OALSimpleAudio sharedInstance];
    [audio playBg:@"gamemusic.m4a" loop:TRUE];
   NSLog(@"TheGameplay loaded");
    self.userInteractionEnabled = YES;
    blinkcounter = 0;
    startgamecountdown.visible = FALSE;
    thetextfieldanimationcopy.visible = FALSE;
    theteleporterglow.opacity = 0;
    dimmerfordisconnectedpanel.visible = FALSE;
    textfieldteleportercover.visible = FALSE;
    textfieldteleporter.visible = FALSE;
    radarbg.visible = FALSE;
    highlighted_delete.visible = FALSE;
    theteleporterglow.visible = TRUE;
    bluetoothAndWifiLabels.visible = TRUE;
    fatmandistraction.positionInPoints = ccp(-1000, -1000);
    hotdogdistraction.positionInPoints = ccp(-1000, -1000);
    spiderdistraction.positionInPoints = ccp(-1000, -1000);
    spaceshipdistraction.positionInPoints = ccp(-1000, -1000);
    solderdistraction.positionInPoints = ccp(-1000, -1000);
    fatmandistraction.visible = TRUE;
    hotdogdistraction.visible = TRUE;
    spiderdistraction.visible = TRUE;
    spaceshipdistraction.visible = TRUE;
    slotmachinestableanimation.visible = FALSE;
    slotmachinestable.visible = TRUE;
    spacebutton.visible = TRUE;
    solderdistraction.visible = TRUE;
    previoustouch = 0.0;
    teleporterimage.visible = FALSE;
    barframe1.visible = 0;
    findingphonewaiter.visible = FALSE;
    oneclick1 = FALSE;
    oneclick2 = FALSE;
    oppdefending.visible = FALSE;
    lifecounter = 1;
    barframe2.visible = 0;
    gameplaybluecover.opacity = 0;
    barframe3.visible = 0;
    playerDisonnectedPopup.visible = FALSE;
    thetextfield.string = @"";
    textfieldstring=[NSMutableString string];
    chathistory.string = @"";
    taptheviruslabel.visible = FALSE;
    showStages.visible = FALSE;
    slotmachine.scale = 0;
    originaloppdefendingcounterwidth = oppdefendingcounter.contentSizeInPoints.width;
    typed_right_letter = 0;
    typed_wrong_letter = 0;
    pressed_space = 0;
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    thechathistorystring= [NSMutableString string];
    theplayerscoinsstring= [NSMutableString string];
    tempmutablestring= [NSMutableString string];
    sendingtempstring =[NSMutableString string];
    // FOR BLUETOOTH INCOMING NOTIFICATIONS v (must be put here for futureself)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerChangedStateWithNotification:) name:@"PeerDidChangeStateNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReceivedDataWithNotification:) name:@"DidReceiveDataNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchasecodeline:) name:@"PurchasedCodeline" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TypeLetter:) name:@"TypeLetter" object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerIsConnecting) name:@"peerIsConnecting" object:nil];
    waitinggifjoin.opacity = 0;
    waitinggifhost.opacity = 0;
    findingplayerslabel.visible = TRUE;
    findinghostlabel.visible = TRUE;
    phoneconnectinganimation.visible = FALSE;
    defendcounter.visible = FALSE;
    _theplayerscoins.string = self.Playercoins;
    tapitlabel.visible = FALSE;
    running = FALSE;
    self.CodeNamesArray = [[NSMutableArray alloc]init];
    self.Codelistvalues = [[NSMutableArray alloc]init];
        showcoinschangelabel.visible = FALSE;
    originalcolor = thetextfield.color;
    cantbuymorethanonelabellabel.visible = FALSE;
    oneclickonly = TRUE;
    cantbuymorethanonelabelcolor.visible = FALSE;
    textiswrong = FALSE;
    warninglabel.visible = FALSE;
    typeindicators.visible = FALSE;
    redtypearrows.visible = FALSE;
            [self.animationManager setPaused:TRUE];
    rightletter = TRUE;
    sendready1.visible = false;
    gettingAttackedWarning.visible = FALSE;
    learninglabels.visible = FALSE;
    self.countdown = FALSE;
    animatingbutton.visible = FALSE;
    audio.allowIpod = TRUE;
    findbuggame.visible = FALSE;
    originalpointofcountdown = defendcounter.position;
    thereddot1.visible = FALSE;
    thereddot2.visible = FALSE;
    thereddot3.visible = FALSE;
    _theplayerscoins.string = self.Playercoins;
    howmanytimesattacked = 1;
    opponentplayerisdefending= FALSE;
    BOOL sound = [[MGWU objectForKey:@"sound"] boolValue];
    originalSlotStrip1Position = ccp(slotstrip1.position.x, slotstrip1.position.y);
    originalSlotStrip2Position = ccp(slotstrip2.position.x, slotstrip2.position.y);
    choice1position = choice1.position;
    choice2position = choice2.position;
    choice3position = choice3.position;
    choice4position = choice4.position;
    choice5position = choice5.position;
    
    if (sound == YES) {
        soundon.visible = TRUE;
        audio.muted = FALSE;
    }
    
    if (sound == NO) {
        soundon.visible = FALSE;
        audio.muted = TRUE;
    }
    
    }
-(void)preparetoshrink{
    shrinkedwidthcalculated = originaloppdefendingcounterwidth;
    
    oppdefendingcountdown = 0;
    
    CGSize theshrinkedsize = CGSizeMake(shrinkedwidthcalculated, oppdefendingcounter.contentSizeInPoints.height);
    [oppdefendingcounter setContentSizeInPoints:theshrinkedsize];
    
    [self performSelector:@selector(shrinkoppdefending) withObject:nil afterDelay:1];
    
}
-(void)shrinkoppdefending{
    
    if (oppdefendingcountdown == 14) {
        CGSize shrinkedsize = CGSizeMake(originaloppdefendingcounterwidth, oppdefendingcounter.contentSizeInPoints.height);
        [oppdefendingcounter setContentSizeInPoints:shrinkedsize];
        
        oppdefendingcounter.visible = FALSE;
        
    }else{
        
        oppdefendingcounter.visible = TRUE;
        
        int decreaseby = originaloppdefendingcounterwidth / 14;
        
        shrinkedwidthcalculated = shrinkedwidthcalculated - decreaseby;
        CGSize shrinkedsize = CGSizeMake(shrinkedwidthcalculated ,oppdefendingcounter.contentSizeInPoints.height);
        [oppdefendingcounter setContentSizeInPoints:shrinkedsize];
        
        oppdefendingcountdown++;
        
        [self performSelector:@selector(shrinkoppdefending) withObject:nil afterDelay:1];
    }
}
-(void)update:(CCTime)delta
{
    NSString *nothing = @"";
    
    if (running) {
        
        if (thetextfieldplaceholder.string.length > 0 && thetextfield.string.length == 0 && playingbuggame == FALSE) {
            typeindicators.visible = TRUE;
            redtypearrows.visible = TRUE;
        }else{
            typeindicators.visible = FALSE;
            redtypearrows.visible = FALSE;
        }
        
        if (self.CodeNamesArray.count == 1 || defending != FALSE || opponentplayerisdefending != FALSE) {
            shoppingcart.visible = FALSE;
            shoppingcart.userInteractionEnabled = FALSE;
        }else{
            shoppingcart.visible = TRUE;
            shoppingcart.userInteractionEnabled = TRUE;
        }
        
        if (![chathistory.string isEqualToString:@""]) {
            thetextfieldplaceholder.string = self.currentmessage;
        }
        
        gobacktogamemodes.visible = FALSE;
        
        overallgametime = overallgametime + delta;
        
        if(opponentplayerisdefending && defending == FALSE){
            if (sendingdistraction) {
            
            thetextfieldplaceholder.string = @"";
            
            }else{
            shoppingcart.visible = FALSE;
            oppdefending.visible = TRUE;
            thetextfieldplaceholder.string = self.distractionstring;
            self.position = ccp(0,0);
            }
            
        }else{
            oppdefending.visible = FALSE;
            sendingdistraction = FALSE;
            
            if ([thetextfieldplaceholder.string isEqualToString:self.distractionstring]) {
                thetextfieldplaceholder.string = @"";
                thetextfield.string = @"";
                [tempmutablestring setString:@""];
                [textfieldstring setString:@""];
            }
            
        }
        
        
        if (playingbuggame != TRUE) {
            defendcounter.position = originalpointofcountdown;
            radarbg.visible = FALSE;
            showStages.visible = FALSE;
            taptheviruslabel.visible = FALSE;
            findbuggame.visible = FALSE;
        }else if(playingbuggame){
            showStages.visible = TRUE;
            taptheviruslabel.visible = TRUE;
            findbuggame.visible = TRUE;
            radarbg.visible = TRUE;
        }
        
        if (pressing != TRUE) {
            qpressed.visible = false;
            wpressed.visible = false;
            epressed.visible = false;
            rpressed.visible = false;
            tpressed.visible = false;
            ypressed.visible = false;
            upressed.visible = false;
            ipressed.visible = false;
            opressed.visible = false;
            ppressed.visible = false;
            apressed.visible = false;
            spressed.visible = false;
            dpressed.visible = false;
            fpressed.visible = false;
            gpressed.visible = false;
            hpressed.visible = false;
            jpressed.visible = false;
            kpressed.visible = false;
            lpressed.visible = false;
            zpressed.visible = false;
            xpressed.visible = false;
            cpressed.visible = false;
            vpressed.visible = false;
            bpressed.visible = false;
            npressed.visible = false;
            mpressed.visible = false;
        }
        
        if(defending){
            shoppingcart.visible = FALSE;
            thetextfieldplaceholder.string = self.currentmessage;
            self.position = ccp(0,0);
            slotmachine.scale = 0;
            theteleporterglow.opacity = 0;
        }
        
        if (thetextfieldplaceholder.string.length == thetextfield.string.length && thetextfieldplaceholder.string.length > 1 &&
            thetextfield.string.length > 1 && defending == FALSE){
            if([thetextfieldplaceholder.string isEqualToString:thetextfield.string]){
//            NSLog(@"\nReady to Send");
            sendready1.visible = true;
            }else{
                thetextfield.fontColor = [CCColor redColor];
                sendready1.visible = FALSE;
                highlighted_delete.visible = TRUE;
            }
        } else{
                            highlighted_delete.visible = FALSE;
            thetextfield.fontColor = [CCColor whiteColor];
            if ([thetextfieldplaceholder.string isEqualToString:thetextfield.string] && defending) {
                sendready1.visible = TRUE;
            }else{
            sendready1.visible = FALSE;
            }
        }
        
        if(thetextfieldplaceholder.string.length == 0 && thetextfield.string.length == 0 && defending == FALSE && self.CodeNamesArray.count == 0){
            animatingbutton.visible = TRUE;
            [self.animationManager runAnimationsForSequenceNamed:@"ButtonAnimationTimeline"];
        }else{
            animatingbutton.visible = FALSE;
            NSString *tempsequencename = [self.animationManager runningSequenceName];
            if ([tempsequencename  isEqual: @"ButtonAnimationTimeline"]) {
                [self.animationManager setPaused:TRUE];
            }
        }
        
        if (thetextfieldplaceholder.string.length == thetextfield.string.length) {
            
            cantypeletter = FALSE;
            
        }else if(thetextfieldplaceholder.string.length != thetextfield.string.length){
            
            cantypeletter = TRUE;
            
        if (thetextfieldplaceholder.string.length > 0 && thetextfield.string.length > 0) {
            
        NSString *substring = [thetextfieldplaceholder.string substringWithRange:NSMakeRange(0, thetextfield.string.length - 0)];
            
        if (![substring isEqualToString:thetextfield.string]) {
            thetextfield.color = [CCColor redColor];
                            highlighted_delete.visible = TRUE;
        }else {
            thetextfield.color = originalcolor;
                            highlighted_delete.visible = FALSE;
        }
        }
        }
        
    if (self.countdown) {
        defending = TRUE;
        countdowntime = countdowntime + delta;
        
        if(countdowntime >= 14.85) {
            
            [self losealife];
            
            pressing = FALSE;
            
            if (self.CodeNamesArray.count == 1) {
                NSString *lowercasedcodeline = [self.CodeNamesArray[0] lowercaseString];
                thetextfieldplaceholder.string = lowercasedcodeline;
            }
            
            self.countdown = FALSE;
            thereddot1.userInteractionEnabled = FALSE;
            thereddot2.userInteractionEnabled = FALSE;
            thereddot3.userInteractionEnabled = FALSE;
            defendcounter.visible = FALSE;
            defendcounter.string = nothing;
            thetextfield.string = nothing;
            [textfieldstring setString:nothing];
            thetextfieldplaceholder.string = nothing;
            findbuggame.visible = FALSE;
            [tempmutablestring setString:@""];
            [textfieldstring setString:@""];
            playingbuggame = FALSE;
            findbuggame.visible = FALSE;
            [self checkifdefending];
            thetextfield.string = nothing;
            chathistory.string = @"";
            defending = FALSE;
        }
        int tempint = 15 - (int)countdowntime;
        NSString *tempstring = [NSString stringWithFormat:@"%i", tempint];
        defendcounter.visible = TRUE;
        defendcounter.string = tempstring;
        NSLog(@"%@", tempstring);
    }else{
        defendcounter.visible = FALSE;
        if (self.CodeNamesArray.count == 1 && sending == FALSE) {
            NSString *lowercasedcodeline = [self.CodeNamesArray[0] lowercaseString];
            thetextfieldplaceholder.string = lowercasedcodeline;
            defending = FALSE;
        }
                    countdowntime = 0;
    }
    thetempint = thetempint + delta;
    if(thetempint >= self.whengivecoins){
        int currentplayercoins = [_theplayerscoins.string intValue];
        int updatedcoins = currentplayercoins + self.coinspertime;
        
        NSMutableString *tempupdatedcoinsstring;
        tempupdatedcoinsstring = [[NSMutableString alloc]init];
        
        NSString *theupdatedcoins = [NSString stringWithFormat:@"%i", updatedcoins];
        [tempupdatedcoinsstring setString:theupdatedcoins];
        _theplayerscoins.string = [NSMutableString stringWithString: tempupdatedcoinsstring];
        
        [self displayaddedcoins:self.coinspertime];
        
        thetempint = 0;
        
//        NSLog(@"\nIT IS TIME: Player is given %i coins \nPlayer has %i coins", self.coinspertime, updatedcoins);
    }
}
        if(self.countdown){
            warninglabel.visible = TRUE;
            backgroundred.visible = TRUE;
            backgroundblue.visible = FALSE;
            [self.animationManager runAnimationsForSequenceNamed:@"GameplayTimelineRed"];
            
        }else{
            warninglabel.visible = FALSE;
            backgroundred.visible = FALSE;
            backgroundblue.visible = TRUE;
            
            [self.animationManager runAnimationsForSequenceNamed:@"GameplayTimelineBlue"];
            [self.animationManager setPaused:TRUE];
        }
        
        
        
        
        if(![chathistory.string  isEqual: @""]){
            NSString *tempstring = [chathistory.string stringByReplacingOccurrencesOfString:@"Defend" withString:@"defend"];
            
            //Removes Defend with defend because the Textfield cant type in uppercase
            
            //Checks every frame to see if the RecievedMessagesLabel is equal to the Textfield
            
            if ([textfieldstring isEqualToString:tempstring]) {
                abletotaptodefend = TRUE;
                self.onetaponlyregulator = TRUE;
//                NSLog(@"\nABLE TO DEFEND!");
                //If the textfield is equal then set abletodefend to True and make the tap it label appear
                
            }else{
                abletotaptodefend = FALSE;
                tapitlabel.visible = FALSE;
                
                //If the textfield is not equal then set the TapIt label to false and Abletodefendfalse
                
        }
    }
}

// ALL OF THE BUTTON METHODS
- (void)hostbuttonmethod {
        [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    
    self.lobby = [[MPCLobby alloc] initLobbyForGame:@"HackerOutbreak" AsHost:YES];
    
            findinghostlabel.string = @"Hosting";
    
    [self movestufftothemiddle:@"hostbutton"];
    
    bluetoothAndWifiLabels.visible = FALSE;
}
-(void)joinbuttonmethod {
        [[OALSimpleAudio sharedInstance] playEffect:@"buttonclick.wav"];
    
    self.lobby = [[MPCLobby alloc] initLobbyForGame:@"HackerOutbreak" AsHost:NO];
    
            findingplayerslabel.string = @"Joining";
    
    [self movestufftothemiddle:@"joinbutton"];
    
        bluetoothAndWifiLabels.visible = FALSE;
}

-(void)movestufftothemiddle:(NSString *)whichbutton{
    
    if ([whichbutton  isEqual: @"joinbutton"]) {
        [joinButton runAction:[CCActionMoveTo actionWithDuration:3 position:ccp(joinButton.position.x,0.50)]];
        
        hostButton.visible = FALSE;
        
        hostbuttoncontainer.visible = FALSE;
    }else if ([whichbutton isEqualToString:@"hostbutton"]){
        
        [hostButton runAction:[CCActionMoveTo actionWithDuration:3 position:ccp(hostButton.position.x,0.50)]];
        
        joinButton.visible = FALSE;
    }
}

-(void)disableteleporter{
teleporterimage.visible = FALSE;
}

-(void)senddistraction:(NSString *)randomdistraction{
    
    id moveDownAction = [CCActionMoveTo actionWithDuration: 1.75 position:ccp(.50, -.03)];
    id moveUpAction = [CCActionMoveTo actionWithDuration: .5 position:ccp(.50, 1)];
    
    teleporterimage.visible = true;
    [self performSelector:@selector(disableteleporter) withObject:nil afterDelay:2.25];
    
    if ([randomdistraction  isEqual: @"1"]) {
        choice1.position = choice1.position;
        
                [choice1 runAction: [CCActionSequence actions: moveDownAction, moveUpAction, nil]];
        
    }
    if ([randomdistraction  isEqual: @"2"]) {
        choice2.position = choice1.position;
        choice1.position = ccp(50, 50);
        
        [choice2 runAction: [CCActionSequence actions: moveDownAction, moveUpAction, nil]];
        
    }
    if ([randomdistraction  isEqual: @"3"]) {
        choice3.position = choice1.position;
        choice1.position = ccp(50, 50);
        
        [choice3 runAction: [CCActionSequence actions: moveDownAction, moveUpAction, nil]];
        
    }
    if ([randomdistraction  isEqual: @"4"]) {
        choice4.position = choice1.position;
        choice1.position = ccp(50, 50);
        
        [choice4 runAction: [CCActionSequence actions: moveDownAction, moveUpAction, nil]];
        
    }
    if ([randomdistraction  isEqual: @"5"]) {
        choice5.position = choice1.position;
        choice1.position = ccp(50, 50);
        
        [choice5 runAction: [CCActionSequence actions: moveDownAction, moveUpAction, nil]];
        
    }
    
    sent_distraction++;
    
    slotmachinestableanimation.visible = FALSE;
    slotmachinestable.visible = TRUE;
    
    sendingdistraction = FALSE;
    
    NSArray *dataarray = [[NSArray alloc]initWithObjects:@"distraction", randomdistraction, @"", nil];
    NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
    NSError* error;
    
    [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
}

-(void)sendbuttonmethod {
    
    if (defending != TRUE && opponentplayerisdefending && [thetextfieldplaceholder.string isEqual: self.distractionstring] && [thetextfield.string isEqualToString:self.distractionstring]) {
        
        sendingdistraction = TRUE;
        
        slotmachine.visible = true;
        slotmachine.opacity = 1;
        
        slotmachinestable.visible = FALSE;
        slotmachinestableanimation.visible = TRUE;
        [slotmachinestableanimation animationstart];
        
        choice1.position = choice1position;
        choice2.position = choice2position;
        choice3.position = choice3position;
        choice4.position = choice4position;
        choice5.position = choice5position;
    
        int slotMachineSpeed = 1;
    
        int randomgenerator = 0;
        randomgenerator = arc4random() % 4 + 1;
    
        NSString *myNumber = [NSString stringWithFormat:@"%i", randomgenerator];
    
    
        id themoveDownActionslotmachine = [CCActionMoveTo actionWithDuration: slotMachineSpeed position:ccp(originalSlotStrip1Position.x, originalSlotStrip2Position.y)];
        
        id themoveToSideActionslotmachine = [CCActionMoveTo actionWithDuration: 0.f position:ccp(originalSlotStrip1Position.x + 5, originalSlotStrip2Position.y)];
    
        id themoveUpActionslotmachine = [CCActionMoveTo actionWithDuration: slotMachineSpeed position:ccp(originalSlotStrip1Position.x + 5, originalSlotStrip1Position.y)];
        
        id resetToMiddle = [CCActionMoveTo actionWithDuration: 0 position:ccp(originalSlotStrip1Position.x, originalSlotStrip1Position.y)];
        
        [slotstrip1 runAction: [CCActionSequence actions: themoveDownActionslotmachine, themoveToSideActionslotmachine, themoveUpActionslotmachine, resetToMiddle,nil]];
    
        [slotstrip2 runAction: [CCActionSequence actions: themoveToSideActionslotmachine, themoveUpActionslotmachine, resetToMiddle, themoveDownActionslotmachine, nil]];
    
    [self performSelector:@selector(senddistraction:) withObject:myNumber afterDelay:2];
        
        NSString *nothing = @"";
        
        thetextfieldplaceholder.string = nothing;
        thetextfield.string = nothing;
        [textfieldstring setString:nothing];
        [tempmutablestring setString:nothing];
    }
    
    
    if (self.CodeNamesArray.count > 0 && opponentplayerisdefending == FALSE) {

        NSString *thecode = [self.CodeNamesArray[0] lowercaseString];
        
    if ([thetextfield.string isEqualToString:thecode] == YES) {
        sendready1.visible = false;
        sending = TRUE;
        NSLog(@"Send Button Pressed");
        barframe1.visible = 1;
        NSString *temp = thetextfield.string;
        [tempmutablestring setString:temp];
        [self performSelector:@selector(sendingbarsteptwo) withObject:nil afterDelay:.75];
        
        NSString *nothing = @"";
        
        textfieldteleportercover.visible = TRUE;
        
        textfieldteleporter.visible = TRUE;
        
        thetextfieldplaceholder.string = nothing;
        
        thetextfieldanimationcopy.position = thetextfield.position;
        
        thetextfieldanimationcopy.visible = TRUE;
        
        thetextfieldanimationcopy.string = thetextfield.string;
        
        [theteleporterglow runAction:[CCActionFadeTo actionWithDuration:0.75 opacity:0.8]];
        
        [thetextfieldanimationcopy runAction: [CCActionMoveTo actionWithDuration:2.5 position:ccp(0.8 , thetextfieldanimationcopy.position.y)]];
        
        thetextfield.string = nothing;
        
    }
    }else if(self.CodeNamesArray.count == 0 && opponentplayerisdefending == FALSE){
        wrongcodeindicator.visible = true;
        [wrongcodeindicator runAction:[CCActionFadeOut actionWithDuration:.3]];
    }
}
// # SEND BUTTON METHODS # //

-(void)sendingbarsteptwo{
    NSLog(@"Ready");
    
    [thetextfieldanimationcopy runAction: [CCActionMoveTo actionWithDuration:.50 position:ccp(1.6 , thetextfieldanimationcopy.position.y)]];
    [theteleporterglow runAction:[CCActionFadeTo actionWithDuration:.50 opacity:0.0]];
    
    [self performSelector:@selector(sendingbarstepthree) withObject:nil afterDelay:.75];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)sendingbarstepthree{
    NSLog(@"Sent");
    
    NSString *thestringbeingsent = tempmutablestring;
    
        if (self.CodeNamesArray.count > 0 && opponentplayerisdefending == FALSE) {
        // CODELINES HERE!!!!!!!!!!!!!!!!!!!!!!! ?/////////////////////////////////////////////////////
        for (int l = 0; l < self.CodeNamesArray.count; l++) {
            
            self.CodeNamesArray[l] = [self.CodeNamesArray[l] lowercaseString];
            
            //It Checks What You've Bought and then sets it to lowercase
            
            if ([thestringbeingsent isEqualToString:self.CodeNamesArray[l]]) {
                NSString *tempstring = [self.CodeNamesArray[l] stringByReplacingOccurrencesOfString:@"attack" withString:@"Defend"];
                
                //Checks if your textfield is equal to what you've purchases and if so then change attack to defend and send the message to the other hacker
                
               // NSData* messageAsData = [tempstring dataUsingEncoding:NSUTF8StringEncoding];
                NSString *thecodereturnvalue = self.Codelistvalues[l];
                
                NSArray *dataarray = [[NSArray alloc]initWithObjects:tempstring, thecodereturnvalue, @"", nil];
                NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
                NSError* error;
                
                [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
                
                //Puts in into NSData so it can be sent to other peer
                
                        sending = FALSE;
                
                [textfieldstring setString:@""];
                [sendingtempstring setString:@""];
                [current setinvisoff];
                
                NSUInteger tempinteger = l;
                
                [self.CodeNamesArray removeObjectAtIndex:tempinteger];
                [self.Codelistvalues removeObjectAtIndex:tempinteger];
                current = nil;
                
                textfieldteleporter.visible = FALSE;
                textfieldteleportercover.visible = FALSE;
                thetextfieldanimationcopy.string = @"";
                thetextfieldanimationcopy.position = ccp(.50, .50);
                thetextfieldanimationcopy.visible = FALSE;
                theteleporterglow.opacity = 0;
                
                sent_attack++;
                
                //Resets string and removes the Codeline that was just used to be sent
                
                if (error != nil) {
                    NSLog(@"%@", [error localizedDescription]);
                    
                }
            }
        }
    }
}


-(void)TypeLetter:(NSNotification *)notification{
    
    NSDictionary* userInfoDict = [notification userInfo];
    
        
    NSString *theletter = [userInfoDict objectForKey:@"theletter"];
    NSString *pressingvar = [userInfoDict objectForKey:@"pressing"];
    
    if ([pressingvar isEqualToString:@"1"]&& playingbuggame != TRUE && thetextfield.string.length != thetextfieldplaceholder.string.length && thetextfieldplaceholder.string.length > 0 && cantypeletter) {
        
        pressing = TRUE;
        
        if ([theletter isEqualToString:@"q"]) {
            qpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"w"]) {
            wpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"e"]) {
            epressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"r"]) {
            rpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"t"]) {
            tpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"y"]) {
            ypressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"u"]) {
            upressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"i"]) {
            ipressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"o"]) {
            opressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"p"]) {
            ppressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"a"]) {
            apressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"s"]) {
            spressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"d"]) {
            dpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"f"]) {
            fpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"g"]) {
            gpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"h"]) {
            hpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"j"]) {
            jpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"k"]) {
            kpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"l"]) {
            lpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"z"]) {
            zpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"x"]) {
            xpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"c"]) {
            cpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"v"]) {
            vpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"b"]) {
            bpressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"n"]) {
            npressed.visible = TRUE;
            rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"m"]) {
            mpressed.visible = TRUE;
            rightletter = !rightletter;
        }
    }
    
    else {
    
    if (playingbuggame != TRUE && thetextfield.string.length != thetextfieldplaceholder.string.length && thetextfieldplaceholder.string.length > 0 && cantypeletter) {
        
        if (thetextfield.string.length == thetextfieldplaceholder.string.length) {
        }else{
        [textfieldstring appendString:theletter];
        thetextfield.string = textfieldstring;
//        NSLog(@"\n%@", textfieldstring);
        thePreviousString = thetextfield.string;
        }
        
        pressing = TRUE;
        
        if ([theletter isEqualToString:@"q"]) {
            qpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"w"]) {
            wpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"e"]) {
            epressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"r"]) {
            rpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"t"]) {
            tpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"y"]) {
            ypressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"u"]) {
            upressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"i"]) {
            ipressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"o"]) {
            opressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"p"]) {
            ppressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"a"]) {
            apressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"s"]) {
            spressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"d"]) {
            dpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"f"]) {
            fpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"g"]) {
            gpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"h"]) {
            hpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"j"]) {
            jpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"k"]) {
            kpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"l"]) {
            lpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"z"]) {
            zpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"x"]) {
            xpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"c"]) {
            cpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"v"]) {
            vpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"b"]) {
            bpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"n"]) {
            npressed.visible = TRUE;
                rightletter = !rightletter;
        }
        if ([theletter isEqualToString:@"m"]) {
            mpressed.visible = TRUE;
                rightletter = !rightletter;
        }
        [self performSelector:@selector(makeinvisible) withObject:nil afterDelay: 0.03];
    }
    
                    NSString *substring = [thetextfieldplaceholder.string substringWithRange:NSMakeRange(0, thetextfield.string.length)];
        
        if (thetextfieldplaceholder.string.length > 0 && thetextfield.string.length > 0 && ![substring isEqualToString:thetextfield.string]){
            
            typed_wrong_letter++;
            
            }else{
                typed_right_letter++;
            }
    }}

-(void)makeinvisible{
    pressing = FALSE;
}

-(void)deletebutton{
    if ([textfieldstring  isEqual: @""]) {
//    NSLog(@"\nNothing In Textfield%@", textfieldstring);

        pressed_delete++;
        
    }else{
    [textfieldstring deleteCharactersInRange:NSMakeRange([textfieldstring length]-1, 1)];
        
    thetextfield.string = textfieldstring;
//    NSLog(@"\n%@", textfieldstring);
    }
    
}
-(void)spacebutton{

    if(playingbuggame != TRUE && thetextfield.string.length != thetextfieldplaceholder.string.length && thetextfieldplaceholder.string.length > 0 && cantypeletter){
    [textfieldstring appendString:@" "];
    thetextfield.string = textfieldstring;
    NSLog(@"\n%@", textfieldstring);
    }
}

//-(void)swipeleft{
//    [gameplay runAction:[CCActionMoveTo actionWithDuration:0.25f position:ccp(-0.5,0)]];
//}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //Check if touch is within the bounding box in shopping icon if so toggle bool to make sure
    CGPoint touchLocation = [touch locationInWorld];
    CGPoint touchLocationinstore = [touch locationInNode:gameplay];
    CGPoint reddottouch = [touch locationInNode:radar];
    CGPoint backhometouch = [touch locationInNode:playerDisonnectedPopup];
    if (CGRectContainsPoint([joinButton boundingBox], touchLocation)) {
        if (![findinghostlabel.string isEqualToString:@"Hosting"] && ![findingplayerslabel.string isEqualToString:@"Joining"] && ![findinghostlabel.string isEqualToString:@"Connecting"]) {
        joinButton.color = [CCColor grayColor];
        }
    }
    if (CGRectContainsPoint([hostButton boundingBox], touchLocation)) {
        if (![findinghostlabel.string isEqualToString:@"Hosting"] && ![findingplayerslabel.string isEqualToString:@"Joining"] && ![findinghostlabel.string isEqualToString:@"Connecting"]) {
        hostButton.color = [CCColor grayColor];
        }
    }
    
    if (CGRectContainsPoint([pressedhome boundingBox], backhometouch)) {
        if (playerDisonnectedPopup.visible) {
            pressedhome.color = [CCColor grayColor];
    }
    }
    
    if ((CGRectContainsPoint([thereddot1 boundingBox], reddottouch) || CGRectContainsPoint([thereddot2 boundingBox], reddottouch) || CGRectContainsPoint([thereddot3 boundingBox], reddottouch)) && playingbuggame ) {
        
        
        if (showbugs == 1) {
            playingbuggame = FALSE;
            findbuggame.visible = FALSE;
            NSLog(@"\nPlayer Touched The Red Dot! (virus)");
            
            NSString *whichstage = stagesLabel.string;
            NSNumber* blinknumber = [NSNumber numberWithInt:blinkcounter];
            NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: blinknumber, @"Number Of Blinks", whichstage, @"Blinking Speed" ,nil];
            [MGWU logEvent:@"won_the_find_virus_game" withParams:params];
        }
        
        bool died = FALSE;
        
        if (CGRectContainsPoint([thereddot1 boundingBox], reddottouch) && playingbuggame) {
            if (died == FALSE) {
                thereddot1.userInteractionEnabled = FALSE;
                thereddot1.visible = FALSE;
                showbugs--;
                died = TRUE;
            }
        }
        if (CGRectContainsPoint([thereddot2 boundingBox], reddottouch) && playingbuggame) {
            if (died == FALSE) {
                thereddot2.userInteractionEnabled = FALSE;
                thereddot2.visible = FALSE;
                showbugs--;
                died = TRUE;
            }
        }
        if (CGRectContainsPoint([thereddot3 boundingBox], reddottouch) && playingbuggame) {
            if (died == FALSE) {
                thereddot3.userInteractionEnabled = FALSE;
                thereddot3.visible = FALSE;
                showbugs--;
                died = TRUE;
            }
        }
        
    }
    
    if (CGRectContainsPoint([gobacktogamemodes boundingBox], touchLocation)) {
        if (running != TRUE) {
        gobacktogamemodes.color = [CCColor grayColor];
        }
    }
    
    if (CGRectContainsPoint([soundmuted boundingBox], touchLocation)) {
        soundon.visible = !soundon.visible;
        audio.muted = !audio.muted;
        
        BOOL sound = [[MGWU objectForKey:@"sound"] boolValue];
        
        if (soundon.visible) {
            NSLog(@"\nSound is on");
            sound = YES;
            [MGWU setObject:[NSNumber numberWithBool:YES] forKey:@"sound"];
            [MGWU logEvent:@"turned_sound_on" withParams:nil];
            
        }else{
            NSLog(@"\nSound is off");
            sound = NO;
            [MGWU setObject:[NSNumber numberWithBool:NO] forKey:@"sound"];
            [MGWU logEvent:@"turned_sound_off" withParams:nil];
        }
    }
        if (running == TRUE) {
    if (CGRectContainsPoint([shoppingcart boundingBox], touchLocation) && playingbuggame != TRUE && opponentplayerisdefending != TRUE)
    {
        NSLog(@"\nPlayer TouchedOnCart");
        if (self.CodeNamesArray.count == 0 && defending == FALSE && thetextfieldplaceholder.string.length == 0) {
        dragging = YES;
        }
    }
    if (CGRectContainsPoint([store boundingBox], touchLocationinstore) && playingbuggame != TRUE)
    {
        
        if (self.CodeNamesArray.count > 0) {
            [gameplay runAction:[CCActionMoveTo actionWithDuration:0.5 position:ccp(0, gameplay.position.y)]];
        }
        if(shoppingcart.visible == TRUE){
        NSLog(@"\nPlayer TouchedOnStore");
        storebool = YES;
        originallocation = touchLocation;
        }else{
            storebool = FALSE;
        }
    }else{
        storebool = FALSE;
    }
    
    if(CGRectContainsPoint([deletebuttonarea boundingBox], touchLocation) && playingbuggame != TRUE)
    {
        [self deletebutton];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(deletebutton) userInfo:nil repeats:YES];
    }
    
    
    if(CGRectContainsPoint([spacebutton boundingBox], touchLocation) && playingbuggame != TRUE)
    {
        if (running) {
        if (![thetextfield.string isEqualToString: thetextfieldplaceholder.string]) {
        [self spacebutton];
        spacepressed.visible = TRUE;
        spacebuttonpressed = TRUE;
        }
        
            pressed_space++;
        
    }
    }
    
    if(CGRectContainsPoint([sendButton boundingBox], touchLocation) && playingbuggame != TRUE)
    {
        if (defending != TRUE) {
        [self sendbuttonmethod];
        sendpressed.visible = TRUE;
        sendbuttonpressed = TRUE;
        }
    }
    
    if (CGRectContainsPoint([sendButton boundingBox], touchLocation))
    {
        if (self.onetaponlyregulator) {
        NSLog(@"\nPlayer defended himself");
        NSString *nothing = @"";
        thetextfield.string = nothing;
        thetextfieldplaceholder.string = nothing;
        
            NSString *attackdefendedname = chathistory.string;
            NSString *timetodefend = defendcounter.string;
            NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: attackdefendedname, @"Defended Attack Name", timetodefend, @"Defending Time", nil];
            [MGWU logEvent:@"defended_attack" withParams:params];
            defended_attack++;
            
        chathistory.string = nothing;
        self.countdown = FALSE;
        tapitlabel.visible = FALSE;
            defending = FALSE;
        defendcounter.string = nothing;
        int tempcodereturnvalue = [self.thecodereturnvalue intValue];
        int thecalculateddefendvalue = tempcodereturnvalue / 2;
        [self defendreward:thecalculateddefendvalue];
        self.onetaponlyregulator = FALSE;
            
            // finally, remove the destroyed sealkj
//            [chathistory removeFromParent];
            NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"NO", nil];
            NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
            
            NSError* error;
            
            [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        }
    }
    }
}
-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    // if bool is true, then update x position of gameplay by the amount of what you touched
    CGPoint touchLocation = [touch locationInWorld];
    
    if (timer != nil)
        [timer invalidate];
    timer = nil;
    
    if (dragging)
    {
        middleofcart = shoppingcart.contentSizeInPoints.width / 2;
        CGPoint XYlocation = ccp(touchLocation.x - maingameplaynode.contentSizeInPoints.width + middleofcart, 0);
        NSLog(@"\nPlayer Swiping Left %f, %f", XYlocation.x, XYlocation.y);
        if (XYlocation.x < 0.0f) {
            gameplay.position = XYlocation;
        }
    }
    if (storebool)
    {
        //FOR THE SCROLL VIEW THE PAN RECOGNIZER AND SCROLLVIEW IS MESSED UPPPPPP
        float gameplayhalf = store.contentSizeInPoints.width * 0.200;
        CGPoint XYlocation = ccp(touchLocation.x - originallocation.x - maingameplaynode.contentSizeInPoints.width, 0);
        
        if (XYlocation.x > self.contentSizeInPoints.width * -1 / 2) {
            NSLog(@"\nPlayer Swiping Left");
            NSLog(@"\nx touchlocation is: %f\ngameplaycontentsize is: %f", originallocation.x - touchLocation.x, gameplayhalf * -1);
            gameplay.position = XYlocation;
        }
    }
    
}
-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    // set bool false, check if touch is halfway across. If not animate gameplay back to position if
    // the touch is more than half animate to across the screen
            CGPoint touchLocation = [touch locationInWorld];
            CGPoint touchLocationinstore = [touch locationInNode:gameplay];
        CGPoint backhometouch = [touch locationInNode:playerDisonnectedPopup];
    
    gobacktogamemodes.color = [CCColor whiteColor];
    pressedhome.color = [CCColor whiteColor];
    joinButton.color = [CCColor whiteColor];
    hostButton.color = [CCColor whiteColor];
    
    
    if (CGRectContainsPoint([gobacktogamemodes boundingBox], touchLocation)) {
        if (running != TRUE) {
            
            gobacktogamemodes.color = [CCColor whiteColor];
            
            [self.lobby thedisconnectmethodnomain];
            [audio stopBg];
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [textfieldstring setString:@""];
            playingbuggame = FALSE;
            didwin = TRUE;
            self.countdown = FALSE;
            chathistory.string = @"";
            defendcounter.string = @"";
            thetextfield.string = @"";
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [self unscheduleAllSelectors];
            running = FALSE;
            NSLog(@"Back Button Pressed");
            CCScene *MainScene = [CCBReader loadAsScene:@"MainScene"];
            [[CCDirector sharedDirector]replaceScene:MainScene];
        }
    }
    
    if (CGRectContainsPoint([pressedhome boundingBox], backhometouch)) {
        if (playerDisonnectedPopup.visible && oneclickonly) {
            oneclickonly = FALSE;
            pressedhome.color = [CCColor whiteColor];
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [self unscheduleAllSelectors];
            
            dimmerfordisconnectedpanel.visible = TRUE;
            
            gobacktogamemodes.visible = FALSE;
            [self.lobby thedisconnectmethod];
        }
    }
    
    if (CGRectContainsPoint([joinButton boundingBox], touchLocation)) {
        if (oneclick1 || oneclick2) {
            
        }else{
            joinButton.color = [CCColor whiteColor];
            [self joinbuttonmethod];
            oneclick1 = TRUE;
            findingplayerslabel.string = @"Joining";
            
            learninglabels.visible = TRUE;
            
            findingphonewaiter.visible = TRUE;
            
            learninglabel1.position = ccp(-0.50, learninglabel1.position.y);
            learninglabel2.position = ccp(0.75, learninglabel2.position.y);
            learninglabel3.position = ccp(-0.50, learninglabel3.position.y);
            
            [learninglabel1 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.131 ,learninglabel1.position.y)]];
            [learninglabel2 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.325 ,learninglabel2.position.y)]];
            [learninglabel3 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.718 ,learninglabel3.position.y)]];
            
            themissioncontainer.position = ccp(.25, 1.35);
            
            id comeintoofar = [CCActionMoveTo actionWithDuration:.50 position:ccp(.25, 1.02)];
            id fixpositon = [CCActionMoveTo actionWithDuration:0.15 position:ccp(.25,1.035)];
            id delay = [CCActionDelay actionWithDuration:1];
            
            [themissioncontainer runAction: [CCActionSequence actions: delay,comeintoofar, fixpositon, nil]];
            
        }
    }
    if (CGRectContainsPoint([hostButton boundingBox], touchLocation)) {
        if (oneclick2 || oneclick1) {
            
        }else{
            hostButton.color = [CCColor whiteColor];
            [self hostbuttonmethod];
            oneclick2 = TRUE;
            findinghostlabel.string = @"Hosting";
            
            learninglabels.visible = TRUE;
            
            findingphonewaiter.visible = TRUE;
            
            learninglabel1.position = ccp(-0.50, learninglabel1.position.y);
            learninglabel2.position = ccp(0.75, learninglabel2.position.y);
            learninglabel3.position = ccp(-0.50, learninglabel3.position.y);
            
            [learninglabel1 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.131 ,learninglabel1.position.y)]];
            [learninglabel2 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.325 ,learninglabel2.position.y)]];
            [learninglabel3 runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(.718 ,learninglabel3.position.y)]];
            
            themissioncontainer.position = ccp(.25, 1.35);
            
            id comeintoofar = [CCActionMoveTo actionWithDuration:.50 position:ccp(.25, 1.02)];
            id fixpositon = [CCActionMoveTo actionWithDuration:0.15 position:ccp(.25,1.035)];
            id delay = [CCActionDelay actionWithDuration:1];
            
            [themissioncontainer runAction: [CCActionSequence actions: delay,comeintoofar, fixpositon, nil]];
        }
    }

    
    if (gameplay.positionInPoints.x > 0) {
        gameplay.positionInPoints = ccp(0, gameplay.positionInPoints.y);
    }
    
    if (timer != nil)
        [timer invalidate];
    timer = nil;
    
    if (dragging && CGRectContainsPoint([maingameplaynode boundingBox], touchLocation))
    {
                animatingbutton.visible = FALSE;
    NSLog(@"\nPlayer SwipedLeft on Tab");
    float gameplayhalf = gameplay.contentSizeInPoints.width * 0.325;
    float thegameplayhalf = maingameplaynode.contentSizeInPoints.width * -1;
        NSLog(@"\n%f, %f, %f", touchLocation.x, gameplayhalf, thegameplayhalf);
    if(touchLocation.x < gameplayhalf){
        [gameplay runAction:[CCActionMoveTo actionWithDuration:.20f position:ccp(thegameplayhalf,0)]];
    }else{
        [gameplay runAction:[CCActionMoveTo actionWithDuration:0.35f position:ccp(0,0)]];
    }
            dragging = NO;
    }
    if (storebool && CGRectContainsPoint([store boundingBox], touchLocationinstore))
    {
        
        NSLog(@"\nPlayer SwipedRight on Store\n");
        float gameplayhalf = store.contentSizeInPoints.width * 0.200;
        float thegameplayhalf = store.contentSizeInPoints.width * -1;
        NSLog(@"\nTouchLocation: %f \nGameplayhalf: %f", originallocation.x - touchLocation.x, gameplayhalf * -1);
        
        if(originallocation.x - touchLocation.x < gameplayhalf * -1){
            [gameplay runAction:[CCActionMoveTo actionWithDuration:.20f position:ccp(0,0)]];
        }else{
            [gameplay runAction:[CCActionMoveTo actionWithDuration:.20f position:ccp(thegameplayhalf,0)]];
        }
        
        storebool = NO;
    }
    if(CGRectContainsPoint([spacebutton boundingBox], touchLocation))
    {
        if (spacebuttonpressed) {
        spacepressed.visible = FALSE;
        spacebuttonpressed = FALSE;
        }
    }
    if(CGRectContainsPoint([sendButton boundingBox], touchLocation))
    {
        if (sendbuttonpressed) {
        sendpressed.visible = FALSE;
        sendbuttonpressed = FALSE;
        }
    }
}
- (void)purchasecodeline:(NSNotification *)notification
{
    if (defending) {
        
    }else{
    if(self.CodeNamesArray.count == 0){
    NSDictionary* userInfoDict = [notification userInfo];
    
    
    
    NSString *codename = [userInfoDict objectForKey:@"codename"];
    NSString *coinvalue = [userInfoDict objectForKey:@"coinvalue"];
    current =  (codeline *)[userInfoDict objectForKey:@"invisibleself"];
    
    [self.Codelistvalues addObject:coinvalue];
    
    //sets info that was given through the notification
    
    int currentcoins = [_theplayerscoins.string intValue];
    int thecoinvalue = [coinvalue intValue];
    
    //changes both strings into ints so they can be subtracted from eachother
    
    if (currentcoins > 0 && currentcoins >= thecoinvalue){
        
        NSString *nothing = @"";
        
        thetextfieldplaceholder.string = nothing;
        thetextfield.string = nothing;
        [tempmutablestring setString:nothing];
        [textfieldstring setString:nothing];
        
        NSLog(@"Player Purchased Codeline ||%@|| which costs ||%@||", codename, coinvalue);
        
        [self.CodeNamesArray addObject:codename];
            [current setinvison];
        
        [current preparetoshrink];
        [current shrink];
        
        int thecalculatedcoins = currentcoins - thecoinvalue;
        
        [self displaysubtractedcoins:thecoinvalue];
        
        NSString *thecoinsstring = [NSString stringWithFormat:@"%i", thecalculatedcoins];
        [theplayerscoinsstring setString:thecoinsstring];
        NSLog(@"%@ is the tempstring", theplayerscoinsstring);
        _theplayerscoins.string = [NSMutableString stringWithString: theplayerscoinsstring];
        NSLog(@"%@ coins are subtracted and %@ is put back in the coinslabel", coinvalue, _theplayerscoins.string);
        
        
          thetextfieldplaceholder.string = [codename lowercaseString];
        
        [gameplay runAction:[CCActionMoveTo actionWithDuration:0.5 position:ccp(0, 0)]];
        
        NSString * attackName = codename;
        NSNumber* attackCoinValue = [NSNumber numberWithInt:thecoinvalue];
        
        NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: attackName, @"Attack Name" ,attackCoinValue, @"Attack Coin Value", nil];
        
        [MGWU logEvent:@"bought_attack" withParams:params];
        bought_attack++;
        
    }else{
        not_enough_coins_to_buy_attack++;
        
        NSLog(@"Player doesn't have enough coins");
        [_theplayerscoins runAction:[CCActionFadeOut actionWithDuration:0.3f]];
        [_theplayerscoins runAction:[CCActionFadeIn actionWithDuration:0.3f]];
        
    }
    }else{
        already_have_onecodeline_bought++;
        cantbuymorethanonelabelcolor.visible = TRUE;
        cantbuymorethanonelabellabel.visible = TRUE;
        [cantbuymorethanonelabelcolor runAction:[CCActionFadeOut actionWithDuration:2.5]];
        [cantbuymorethanonelabellabel runAction:[CCActionFadeOut actionWithDuration:2.5]];
    }
}
}

-(void)initiatecountdown{
    self.countdown = TRUE;
}
-(void)losealife{
    lost_life++;
    if (lifecounter == 3){
        thetextfield.string = @"";
        [textfieldstring setString:@""];
        abletotaptodefend = FALSE;
        tapitlabel.visible = FALSE;
                defending = FALSE;
        
        wifi3.color = [CCColor redColor];
        
        id blinkfastout = [CCActionFadeOut actionWithDuration:.5];
        
        id blinkfastin = [CCActionFadeIn actionWithDuration:.5];
        
        id blinkslowout = [CCActionFadeOut actionWithDuration:2];
        
        [wifi3 runAction:[CCActionSequence actions: blinkfastout, blinkfastin, blinkslowout, nil]];
        
            NSLog (@"Player has 2 lives now");
        chathistory.string = @"";
        defendcounter.string = @"";
        self.countdown = FALSE;
        lifecounter--;
        Livescounterlabel.color = [CCColor redColor];
        Livescounterlabel.string = @"Lives: 2";
        NSString *twolives = @"::2::";
                    thetextfieldplaceholder.string = @"";
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", twolives, @"", nil];
        NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        NSError* error;
        
        [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
        if (self.CodeNamesArray.count == 1) {
            NSString *lowercasedcodeline = [self.CodeNamesArray[0] lowercaseString];
            thetextfieldplaceholder.string = lowercasedcodeline;
            NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"NO", nil];
            NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
            
            NSError* error;
            
            [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        }

    }else if (lifecounter == 2){
                [textfieldstring setString:@""];
                thetextfield.string = @"";
        abletotaptodefend = FALSE;
        tapitlabel.visible = FALSE;
                        defending = FALSE;
        wifi2.color = [CCColor redColor];
        
        id blinkfastout = [CCActionFadeOut actionWithDuration:.5];
        
        id blinkfastin = [CCActionFadeIn actionWithDuration:.5];
        
        id blinkslowout = [CCActionFadeOut actionWithDuration:2];
        
        [wifi2 runAction:[CCActionSequence actions: blinkfastout, blinkfastin, blinkslowout, nil]];
        
        wifi1.color = [CCColor redColor];
        
            NSLog (@"Player has 1 lives now");
        chathistory.string = @"";
        defendcounter.string = @"";
        self.countdown = FALSE;
        lifecounter--;
        Livescounterlabel.color = [CCColor redColor];
        Livescounterlabel.string = @"Lives: 1";
        NSString *onelives = @"::1::";
        thetextfieldplaceholder.string = @"";
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", onelives, @"", nil];
        NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        NSError* error;
        
        if (self.CodeNamesArray.count == 1) {
            NSString *lowercasedcodeline = [self.CodeNamesArray[0] lowercaseString];
            thetextfieldplaceholder.string = lowercasedcodeline;
            NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"NO", nil];
            NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
            
            NSError* error;
            
            [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        }
        
        [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
    }else if (lifecounter == 1 || lifecounter == 0){
                [textfieldstring setString:@""];
                thetextfield.string = @"";
        abletotaptodefend = FALSE;
        tapitlabel.visible = FALSE;
                        defending = FALSE;
        if (self.CodeNamesArray.count == 1) {
            NSString *lowercasedcodeline = [self.CodeNamesArray[0] lowercaseString];
            thetextfieldplaceholder.string = lowercasedcodeline;
            NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"NO", nil];
            NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
            
            NSError* error;
            
            [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        }
        
        lifecounter--;
        Livescounterlabel.string = @"Lives: 0";
    wifi1.visible = FALSE;
    self.countdown = FALSE;
    chathistory.string = @"";
    defendcounter.string = @"";
        
    thetextfieldplaceholder.string = @"";
        
    NSString *hackerstring = @"_PlayerSuccessfullyHacked_";
        NSString *nothing = @"1";
        
        NSArray *dataarray = [[NSArray alloc]initWithObjects:hackerstring, nothing, nothing,nil];
        NSData* codevalue = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
    NSError* error;
        
        
        
    [self.lobby.session sendData:codevalue toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
            
            
        }
    }
}

-(void)performlose{
    lost_life++;
    int tempgametime = (int)overallgametime;
    
    NSNumber* theoverallgametime = [NSNumber numberWithInt:tempgametime];
    NSNumber* numbertyped_right_letter = [NSNumber numberWithInt:typed_right_letter];
    NSNumber* numbertyped_wrong_letter = [NSNumber numberWithInt:typed_wrong_letter];
    NSNumber* numberopponent_lost_life = [NSNumber numberWithInt:opponent_lost_life];
    NSNumber* numberlost_life = [NSNumber numberWithInt:lost_life];
    NSNumber* numberrecieved_attack = [NSNumber numberWithInt:recieved_attack];
    NSNumber* numberrecieved_distraction = [NSNumber numberWithInt:recieved_distraction];
    NSNumber* numberpressed_space = [NSNumber numberWithInt:pressed_space];
    NSNumber* numberconnected_to_game= [NSNumber numberWithInt:connected_to_game];
    NSNumber* numberpressed_to_connect_to_game= [NSNumber numberWithInt:pressed_to_connect_to_game];
    NSNumber* numbersent_distraction= [NSNumber numberWithInt:sent_distraction];
    NSNumber* numbersent_attack= [NSNumber numberWithInt:sent_attack];
    NSNumber* numberpressed_delete= [NSNumber numberWithInt:pressed_delete];
    NSNumber* numberdefended_attack= [NSNumber numberWithInt:defended_attack];
    NSNumber* numberbought_attack= [NSNumber numberWithInt:bought_attack];
    NSNumber* numbernot_enough_coins_to_buy_attack= [NSNumber numberWithInt:not_enough_coins_to_buy_attack];
    NSNumber* numberalready_have_onecodeline_bought= [NSNumber numberWithInt:already_have_onecodeline_bought];
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            theoverallgametime, @"Game_Time_Length",
                            numbertyped_right_letter, @"typed_right_letter",
                            numbertyped_wrong_letter, @"typed_wrong_letter",
                            numberpressed_space, @"pressed_space",
                            numberopponent_lost_life, @"opponent_lost_life",
                            numberlost_life, @"lost_own_life",
                            numberrecieved_distraction, @"recieved_distraction",
                            numberrecieved_attack, @"recieved_attack",
                            numberconnected_to_game, @"connected_to_game",
                            numberpressed_to_connect_to_game, @"pressed_to_connect_to_game",
                            numbersent_distraction, @"sent_distraction",
                            numbersent_attack, @"sent_attack",
                            numberpressed_delete, @"pressed_delete",
                            numberdefended_attack, @"defended_attack",
                            numberbought_attack, @"bought_attack",
                            numbernot_enough_coins_to_buy_attack, @"not_enough_coins_to_buy_attack",
                            numberalready_have_onecodeline_bought, @"already_have_onecodeline_bought",
                            
                            nil];
    
    [MGWU logEvent:@"lost_game" withParams:params];
            [textfieldstring setString:@""];
    playingbuggame = FALSE;
    didlose = TRUE;
    self.countdown = FALSE;
    chathistory.string = @"";
    defendcounter.string = @"";
    thetextfield.string = @"";
    [self.lobby thedisconnectmethodnomain];
            [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self unscheduleAllSelectors];
    running = FALSE;
    Youlose *youloseobject = [Youlose alloc];
    [youloseobject updatestring];
    CCScene *YouLoseScene = [CCBReader loadAsScene:@"Youlose"];
    [[CCDirector sharedDirector]replaceScene:YouLoseScene];
}

-(void)performwin{
    opponent_lost_life++;
    int tempgametime = (int)overallgametime;
    
    NSNumber* theoverallgametime = [NSNumber numberWithInt:tempgametime];
    NSNumber* numbertyped_right_letter = [NSNumber numberWithInt:typed_right_letter];
    NSNumber* numbertyped_wrong_letter = [NSNumber numberWithInt:typed_wrong_letter];
    NSNumber* numberopponent_lost_life = [NSNumber numberWithInt:opponent_lost_life];
    NSNumber* numberlost_life = [NSNumber numberWithInt:lost_life];
    NSNumber* numberrecieved_attack = [NSNumber numberWithInt:recieved_attack];
    NSNumber* numberrecieved_distraction = [NSNumber numberWithInt:recieved_distraction];
    NSNumber* numberpressed_space = [NSNumber numberWithInt:pressed_space];
    NSNumber* numberconnected_to_game= [NSNumber numberWithInt:connected_to_game];
    NSNumber* numberpressed_to_connect_to_game= [NSNumber numberWithInt:pressed_to_connect_to_game];
    NSNumber* numbersent_distraction= [NSNumber numberWithInt:sent_distraction];
    NSNumber* numbersent_attack= [NSNumber numberWithInt:sent_attack];
    NSNumber* numberpressed_delete= [NSNumber numberWithInt:pressed_delete];
    NSNumber* numberdefended_attack= [NSNumber numberWithInt:defended_attack];
    NSNumber* numberbought_attack= [NSNumber numberWithInt:bought_attack];
    NSNumber* numbernot_enough_coins_to_buy_attack= [NSNumber numberWithInt:not_enough_coins_to_buy_attack];
    NSNumber* numberalready_have_onecodeline_bought= [NSNumber numberWithInt:already_have_onecodeline_bought];
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            theoverallgametime, @"Game_Time_Length",
                            numbertyped_right_letter, @"typed_right_letter",
                            numbertyped_wrong_letter, @"numbertyped_wrong_letter",
                            numberpressed_space, @"pressed_space",
                            numberopponent_lost_life, @"opponent_lost_life",
                            numberlost_life, @"lost_own_life",
                            numberrecieved_distraction, @"recieved_distraction",
                            numberrecieved_attack, @"recieved_attack",
                            numberconnected_to_game, @"connected_to_game",
                            numberpressed_to_connect_to_game, @"pressed_to_connect_to_game",
                            numbersent_distraction, @"sent_distraction",
                            numbersent_attack, @"sent_attack",
                            numberpressed_delete, @"pressed_delete",
                            numberdefended_attack, @"defended_attack",
                            numberbought_attack, @"bought_attack",
                            numbernot_enough_coins_to_buy_attack, @"not_enough_coins_to_buy_attack",
                            numberalready_have_onecodeline_bought, @"already_have_onecodeline_bought",
                            
                            nil];
    
        [MGWU logEvent:@"won_game" withParams:params];
            [textfieldstring setString:@""];
    playingbuggame = FALSE;
    didwin = TRUE;
    self.countdown = FALSE;
    chathistory.string = @"";
    defendcounter.string = @"";
    thetextfield.string = @"";
    [self.lobby thedisconnectmethodnomain];
            [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self unscheduleAllSelectors];
    running = FALSE;
    Youlose *youloseobject = [Youlose alloc];
    [youloseobject updatestring];
    CCScene *Youwinscene = [CCBReader loadAsScene:@"Youwin"];
    [[CCDirector sharedDirector]replaceScene:Youwinscene];
}
-(void)defendreward:(int)thecalculateddefendreward{
    int currentcoins = [_theplayerscoins.string intValue];
    int playercoinvaluewithreward = currentcoins + thecalculateddefendreward;
    
    NSString *tempcoinsstring = [NSString stringWithFormat:@"%i", playercoinvaluewithreward];
    [tempmutablestring setString:tempcoinsstring];
    NSLog(@"\nPlayer is rewarded with %d coins for defending", thecalculateddefendreward);
    NSLog(@"\n%@ is the returned playercoins with reward", tempmutablestring);
    _theplayerscoins.string = [NSMutableString stringWithString: tempmutablestring];
    
    [textfieldstring setString:@""];
    thetextfield.string = textfieldstring;
    [self displayaddedcoins:thecalculateddefendreward];
    
}

-(void)displayaddedcoins:(int)coinstodisplay{
    showcoinschangelabel.visible = TRUE;
    NSString *thecoinstodisplay = [NSString stringWithFormat:@"+%i", coinstodisplay];
    
    showcoinschangelabel.string = thecoinstodisplay;
    [showcoinschangelabel runAction:[CCActionFadeOut actionWithDuration:0.5]];
}
-(void)displaysubtractedcoins:(int)coinstodisplay{
    showcoinschangelabel.visible = TRUE;
    NSString *thecoinstodisplay = [NSString stringWithFormat:@"-%i", coinstodisplay];
    
    showcoinschangelabel.string = thecoinstodisplay;
    [showcoinschangelabel runAction:[CCActionFadeOut actionWithDuration:0.5]];
    
}

-(void)findbuggame{
    
    thereddot1.userInteractionEnabled = TRUE;
    findbuggame.visible = true;
    if (playingbuggame) {
        
        radarbg.visible = TRUE;
        
    defendcounter.position = ccp(0.5 , 0.15);
        
        int stage = howmanytimesattacked - 1;
        
        stagesLabel.string = [NSString stringWithFormat:@"Stage: %i", stage];
        
        float temprate = 0.0;
        
        if (howmanytimesattacked <= 5) {
            temprate = 2.0f / howmanytimesattacked;
        }else{
            temprate = 1.3f / howmanytimesattacked;
        }
        
    [self performSelector:@selector(blink) withObject:nil afterDelay: temprate];
        NSLog(@"\nBlink Rate: %f", temprate);
        
        chathistory.visible = false;
        
    }
}
-(void)blink{
    if (playingbuggame) {
    
        thereddot1.userInteractionEnabled = TRUE;
        thereddot2.userInteractionEnabled = TRUE;
        thereddot3.userInteractionEnabled = TRUE;
        
        float thexlocation;
        float theylocation;
        float thexlocation2;
        float theylocation2;
        float thexlocation3;
        float theylocation3;
        
        thexlocation = arc4random_uniform(maingameplaynode.contentSizeInPoints.width + 1);
        theylocation = arc4random_uniform(radar.contentSizeInPoints.height + 1);
        thexlocation2 = arc4random_uniform(maingameplaynode.contentSizeInPoints.width + 1);
        theylocation2 = arc4random_uniform(radar.contentSizeInPoints.height + 1);
        thexlocation3 = arc4random_uniform(maingameplaynode.contentSizeInPoints.width + 1);
        theylocation3 = arc4random_uniform(radar.contentSizeInPoints.height + 1);
        
        thereddot1.positionInPoints = ccp(thexlocation, theylocation);
        thereddot2.positionInPoints = ccp(thexlocation2, theylocation2);
        thereddot3.positionInPoints = ccp(thexlocation3, theylocation3);
        
        
        [self performSelector:@selector(findbuggame) withObject:nil afterDelay:0.0];
    }else{
        thereddot1.userInteractionEnabled = FALSE;
        thereddot2.userInteractionEnabled = FALSE;
        thereddot3.userInteractionEnabled = FALSE;
        chathistory.visible = TRUE;
        blinkcounter++;
        
    }
}

-(void)checkifdefending{
    if (defendcounter.visible == TRUE) {
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"YES", nil];
        NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
        NSError* error;
        
        [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
    }
    if (defendcounter.visible == FALSE) {
        NSArray *dataarray = [[NSArray alloc]initWithObjects:@"", @"", @"NO", nil];
        NSData* thedata = [NSKeyedArchiver archivedDataWithRootObject:dataarray];
        
        NSError* error;
        
        [self.lobby.session sendData:thedata toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
    }
}
@end

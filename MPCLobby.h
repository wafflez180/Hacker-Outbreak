//
//  MPCLobby.h
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MPCLobby : NSObject <MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate, UIAlertViewDelegate>

@property BOOL                      isHost;
@property NSString*                 gameID;
@property (nonatomic) MCPeerID*     myPeerID;
@property MCSession*                session;

- (id)initLobbyForGame:(NSString *)gameID AsHost:(BOOL)isHost;

-(void)thedisconnectmethod;
-(void)thedisconnectmethodnomain;
//TODO: cancel / leave lobby / disconnect

@end

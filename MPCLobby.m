//
//  MPCLobby.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/12/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MPCLobby.h"
#import "MainScene.h"

@implementation MPCLobby
{
    //only used if host
    MCNearbyServiceBrowser*         _browser;
    //only used if join
    MCNearbyServiceAdvertiser*      _advertiser;
    
    NSArray*                        _arrayInvitationHandler;
}

@synthesize isHost =        _isHost;
@synthesize gameID =        _gameID;
@synthesize myPeerID =      _myPeerID;
@synthesize session =       _session;

- (id)initLobbyForGame:(NSString *)gameID AsHost:(BOOL)isHost{
    if (self = [super init]) {
        self.isHost = _isHost;
        self.gameID = [NSString stringWithFormat:@"%@", gameID];
        
        if (isHost) {
            NSLog(@"Hosting a lobby!");
            _browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.myPeerID serviceType:self.gameID];
            _browser.delegate = self;
            [_browser startBrowsingForPeers];
        } else {
            NSLog(@"Joining a lobby!");
            _advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.myPeerID discoveryInfo:nil serviceType:self.gameID];
            _advertiser.delegate = self;
            [_advertiser startAdvertisingPeer];
        }
    }
    
    return self;
}

- (MCPeerID *)myPeerID {
    if (!_myPeerID) {
        _myPeerID = [[MCPeerID alloc] initWithDisplayName:[UIDevice currentDevice].name];
    }
    return _myPeerID;
}

#pragma mark - MCNearbyServiceBrowserDelegate

- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    [[[UIAlertView alloc] initWithTitle:@"Hacker Opponent Found" message:peerID.displayName delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
    if (!self.session) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"peerIsConnecting" object:nil userInfo:nil];
        self.session = [[MCSession alloc] initWithPeer:self.myPeerID];
        self.session.delegate = self;
    }
    
    //connect to the discovered peer
    [_browser invitePeer:peerID toSession:self.session withContext:nil timeout:60.0];
}

- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{
    
    
}

- (void)browser:(MCNearbyServiceBrowser *)browser didNotStartBrowsingForPeers:(NSError *)error
{
    NSLog(@"ERROR - didNotStartBrowsingForPeers: %@", error);
}


#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler
{
    _arrayInvitationHandler = [NSArray arrayWithObject:[invitationHandler copy]];
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Join Game?" message:[NSString stringWithFormat:@"%@ invited you to a game", peerID.displayName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Join", nil];
    [alertView show];
}

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didNotStartAdvertisingPeer:(NSError *)error
{
    NSLog(@"ERROR - didNotStartAdvertisingPeer: %@", error);
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL accept = (buttonIndex != alertView.cancelButtonIndex) ? YES : NO;
    
    //respond
    if (accept) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"peerIsConnecting" object:nil userInfo:nil];

        self.session = [[MCSession alloc] initWithPeer:self.myPeerID];
        self.session.delegate = self;
    }else{
        [self thedisconnectmethod];
    }
    
    void (^invitationHandler)(BOOL, MCSession *) = [_arrayInvitationHandler objectAtIndex:0];
    invitationHandler(accept, self.session);
    
    [_advertiser stopAdvertisingPeer];
}

#pragma mark - MCSessionDelegate Protocol

// posts a notification when a peer connects, is connecting, or disconnects
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    NSDictionary* userInfo = @{@"peerID": peerID,
                               @"state": @(state)};
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PeerDidChangeStateNotification" object:nil userInfo:userInfo];
    });
}

// posts a notification upon receiving data
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSDictionary* userInfo = @{@"data": data,
                               @"peerID": peerID};
    
    NSLog(@"Data notification received from %@", peerID);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DidReceiveDataNotification" object:nil userInfo:userInfo];
    });
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {}


// fixes potential bug of MCSession disconnecting randomly: http://stackoverflow.com/questions/18935288/why-does-my-mcsession-peer-disconnect-randomly
- (void) session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL accept))certificateHandler
{
    certificateHandler(YES);
}

-(void)thedisconnectmethod{
    [_session disconnect];
    [_browser stopBrowsingForPeers];
    [_advertiser stopAdvertisingPeer];
    _session = nil;
    _browser = nil;
    _advertiser = nil;
    CCScene *newScene = [CCBReader loadAsScene:@"MainScene"];
    MainScene *mainScene = newScene.children[0];
    [mainScene disconnected];
    [[CCDirector sharedDirector] replaceScene:newScene];
}
-(void)thedisconnectmethodnomain{
    [_session disconnect];
    [_browser stopBrowsingForPeers];
    [_advertiser stopAdvertisingPeer];
    _session = nil;
    _browser = nil;
    _advertiser = nil;
}
@end

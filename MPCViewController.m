//
//  MPCViewController.m
//  MPCLobby
//
//  Created by Arthur Araujo on 7/8/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MPCViewController.h"
#import "MPCLobby.h"

#define GAME_NAME               @"Hacker Outbreak"

@interface MPCViewController ()

@end

@implementation MPCViewController

@synthesize lobby =             _lobby;
@synthesize hostButton =        _hostButton;
@synthesize joinButton =        _joinButton;
@synthesize sendButton =        _sendButton;
@synthesize peerListTextView =  _peerListTextView;
@synthesize messageTextField =  _messageTextField;
@synthesize chatHistory =       _chatHistory;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerChangedStateWithNotification:) name:@"PeerDidChangeStateNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReceivedDataWithNotification:) name:@"DidReceiveDataNotification" object:nil];
    
    self.messageTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Player Interaction

- (IBAction)hostPressed:(id)sender
{
    self.lobby = [[MPCLobby alloc] initLobbyForGame:GAME_NAME AsHost:YES];
    
    [self.hostButton setEnabled:NO];
    [self.joinButton setEnabled:NO];
}

- (IBAction)joinPressed:(id)sender
{
    self.lobby = [[MPCLobby alloc] initLobbyForGame:GAME_NAME AsHost:NO];
    
    [self.hostButton setEnabled:NO];
    [self.joinButton setEnabled:NO];
}

- (IBAction)sendPressed:(id)sender
{
    if (self.messageTextField.text.length > 0) {
        NSData* messageAsData = [self.messageTextField.text dataUsingEncoding:NSUTF8StringEncoding];
        NSError* error;
        [self.lobby.session sendData:messageAsData toPeers:self.lobby.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
        
        [self addMessageToSelf:self.messageTextField.text];
        
        //reset text field
        [self.messageTextField setText:@""];
        
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

- (void)addMessageToSelf:(NSString *)message
{
    [self.chatHistory setText:[NSString stringWithFormat:@"%@: %@\n%@", self.lobby.myPeerID.displayName, message, self.chatHistory.text]];
}

#pragma mark - Network Notifications

- (void)peerChangedStateWithNotification:(NSNotification *)notification
{
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    if (state != MCSessionStateConnecting) {
        NSString* allPlayers = @"Other players connected with:\n";
        
        for (int i = 0; i < self.lobby.session.connectedPeers.count; i++) {
            NSString* displayName = [[self.lobby.session.connectedPeers objectAtIndex:i] displayName];
            
            allPlayers = [allPlayers stringByAppendingString:@"\n"];
            allPlayers = [allPlayers stringByAppendingString:displayName];
        }
        
        [self.peerListTextView setText:allPlayers];
    }
}

- (void)handleReceivedDataWithNotification:(NSNotification *)notification
{
    NSDictionary* userInfoDict = [notification userInfo];
    
    NSData* receivedData = [userInfoDict objectForKey:@"data"];
    NSString* message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    // keep the sender's peerID and get its deisplay name
    MCPeerID* senderPeerID = [userInfoDict objectForKey:@"peerID"];
    NSString* senderDisplayName = senderPeerID.displayName;
    
//    [self.messageTextField setText:[NSString stringWithFormat:@"%@: %@", senderDisplayName, message]];
    [self.chatHistory setText:[NSString stringWithFormat:@"%@: %@\n%@", senderDisplayName, message, self.chatHistory.text]];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"end text");
    if (textField == self.messageTextField) {
        [textField resignFirstResponder];
        [self sendPressed:nil];
        return NO;
    }
    return YES;
}

@end

//
//  MPCViewController.h
//  MPCLobby
//
//  Created by Arthur Araujo on 7/8/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPCLobby;

@interface MPCViewController : UIViewController <UITextFieldDelegate>

@property MPCLobby*                 lobby;

@property IBOutlet UIButton*        hostButton;
@property IBOutlet UIButton*        joinButton;
@property IBOutlet UIButton*        sendButton;
@property IBOutlet UITextView*      peerListTextView;
@property IBOutlet UITextField*     messageTextField;
@property IBOutlet UITextView*      chatHistory;

- (IBAction)hostPressed:(id)sender;
- (IBAction)joinPressed:(id)sender;
- (IBAction)sendPressed:(id)sender;

@end

//
//  TheList.m
//  TheHackingGame
//
//  Created by Arthur Araujo on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "TheList.h"
#import "Gameplay.h"
#import "Playercoins.h"

@implementation TheList{
    CCNode *_list;
    
    // v IS THE STRING FOR THE CODE
    CCLabelTTF *_thecode1;
    CCLabelTTF *_thecode2;
    CCLabelTTF *_thecode3;
    CCLabelTTF *_thecode4;
    CCLabelTTF *_thecode5;
    CCLabelTTF *_thecode6;
    CCLabelTTF *_thecode7;
    CCLabelTTF *_thecode8;
    CCLabelTTF *_thecode9;
    CCLabelTTF *_thecode10;
    CCLabelTTF *_thecode11;
    
    //VARIABLE TO CONTAIN THE STRING
    
    NSString *thecodestring1;
    NSString *thecodestring2;
    NSString *thecodestring3;
    NSString *thecodestring4;
    NSString *thecodestring5;
    NSString *thecodestring6;
    NSString *thecodestring7;
    NSString *thecodestring8;
    NSString *thecodestring9;
    NSString *thecodestring10;
    NSString *thecodestring11;
    // v THE INTEGER FOR THE CODE (it is set in the method)
    int thecoinvalue1;
    int thecoinvalue2;
    int thecoinvalue3;
    int thecoinvalue4;
    int thecoinvalue5;
    int thecoinvalue6;
    int thecoinvalue7;
    int thecoinvalue8;
    int thecoinvalue9;
    int thecoinvalue10;
    int thecoinvalue11;
    // v ARE THE WHOLE NODE
    CCNode *codeline1;
    CCNode *codeline2;
    CCNode *codeline3;
    CCNode *codeline4;
    CCNode *codeline5;
    CCNode *codeline6;
    CCNode *codeline7;
    CCNode *codeline8;
    CCNode *codeline9;
    CCNode *codeline10;
    CCNode *codeline11;
    // v ARE THE COIN VALUES
    CCLabelTTF *coinvalue1;
    CCLabelTTF *coinvalue2;
    CCLabelTTF *coinvalue3;
    CCLabelTTF *coinvalue4;
    CCLabelTTF *coinvalue5;
    CCLabelTTF *coinvalue6;
    CCLabelTTF *coinvalue7;
    CCLabelTTF *coinvalue8;
    CCLabelTTF *coinvalue9;
    CCLabelTTF *coinvalue10;
    CCLabelTTF *coinvalue11;
    // v IS THE SHADE OVER THE CODELINE
    CCNodeColor *invisible1;
    CCNodeColor *invisible2;
    CCNodeColor *invisible3;
    CCNodeColor *invisible4;
    CCNodeColor *invisible5;
    CCNodeColor *invisible6;
    CCNodeColor *invisible7;
    CCNodeColor *invisible8;
    CCNodeColor *invisible9;
    CCNodeColor *invisible10;
    CCNodeColor *invisible11;
    
    NSMutableString *tempstring;
    int tempcoins;
}

- (void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    [tempstring appendString:@""];
}

// I = TO THE LINES OF CODE YOU HAVE + 1
-(void)thearraysetter{
    thecoinvalue1 = [coinvalue1.string intValue];
    thecoinvalue2 = [coinvalue2.string intValue];
    thecoinvalue3 = [coinvalue3.string intValue];
    thecoinvalue4 = [coinvalue4.string intValue];
    thecoinvalue5 = [coinvalue5.string intValue];
    thecoinvalue6 = [coinvalue6.string intValue];
    thecoinvalue7 = [coinvalue7.string intValue];
    thecoinvalue8 = [coinvalue8.string intValue];
    thecoinvalue9 = [coinvalue9.string intValue];
    thecoinvalue10 = [coinvalue10.string intValue];
    thecoinvalue11 = [coinvalue11.string intValue];
    thecodestring1 = _thecode1.string;
    thecodestring2 = _thecode2.string;
    thecodestring3 = _thecode3.string;
    thecodestring4 = _thecode4.string;
    thecodestring5 = _thecode5.string;
    thecodestring6 = _thecode6.string;
    thecodestring7 = _thecode7.string;
    thecodestring8 = _thecode8.string;
    thecodestring9 = _thecode9.string;
    thecodestring10 = _thecode10.string;
    thecodestring11 = _thecode11.string;
    _codelist = [NSMutableArray arrayWithObjects:thecodestring1,thecodestring2,thecodestring3,thecodestring4, thecodestring5,thecodestring6,thecodestring7,thecodestring8,thecodestring9,thecodestring10,thecodestring11, nil];
    
    _invisibilitycodelist = [NSMutableArray arrayWithObjects: invisible1, invisible2, invisible3, invisible4, invisible5 , invisible6, invisible7, invisible8, invisible9, invisible10, invisible11, nil];
    
    _codevaluelist = [NSMutableArray arrayWithObjects: coinvalue1, coinvalue2, coinvalue3, coinvalue4,coinvalue5, coinvalue6, coinvalue7, coinvalue8, coinvalue9, coinvalue10, coinvalue11 ,nil];
}
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //Check if touch is within the bounding box in shopping icon if so toggle bool to make sure
    CGPoint touchLocation = [touch locationInNode:_list];
    if (CGRectContainsPoint([codeline1 boundingBox], touchLocation))
    {
        Gameplay *thegameplay = [[Gameplay alloc] init];
        NSLog(@"Player Tapped Codeline1");
        [thegameplay subtractplayerscoins];
    }
}
@end

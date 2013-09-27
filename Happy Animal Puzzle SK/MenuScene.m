//
//  MyScene.m
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/27/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene

- (void)createContent {
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"main_menu_bg.png"];
    bg.position = skp(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:bg];
    
//    [self createLogo];
}

- (void)didMoveToView:(SKView *)view {
    [self createContent];
}

- (void)createLogo {
    SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed:@"logo.png"];
    logo.position = skp(CGRectGetMidX(self.frame), self.frame.size.height - 100);
    [self addChild:logo];
    logo.name = @"logo";
    
    SKSpriteNode *eye1 = [SKSpriteNode spriteNodeWithImageNamed:@"eye_0.png"];
    eye1.position = skp(73, 122);
    [logo addChild:eye1];
    
    SKSpriteNode *eye2 = [SKSpriteNode spriteNodeWithImageNamed:@"eye_0.png"];
    eye2.position = skp(100, 127);
    [logo addChild:eye2];
    
    SKSpriteNode *eye3 = [SKSpriteNode spriteNodeWithImageNamed:@"eye_0.png"];
    eye3.position = skp(312, 125);
    [logo addChild:eye3];
    
    SKSpriteNode *eye4 = [SKSpriteNode spriteNodeWithImageNamed:@"eye_0.png"];
    eye4.position = skp(342, 127);
    [logo addChild:eye4];
    
//    [NSTimer scheduledTimerWithTimeInterval:5.0f
//                                     target:self
//                                   selector:@selector(playEyeAnimate)
//                                   userInfo:nil
//                                    repeats:YES];
}

- (void)playEyeAnimate {
    
}

@end

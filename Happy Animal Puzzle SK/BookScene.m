//
//  BookScene.m
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/27/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import "BookScene.h"

@implementation BookScene

- (void)createContent {
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"farm_book_open.png"];
    background.position = skp([self centerX], [self centerY]);
    [self addChild:background];
}

- (void)didMoveToView:(SKView *)view {
    [self createContent];
}

@end

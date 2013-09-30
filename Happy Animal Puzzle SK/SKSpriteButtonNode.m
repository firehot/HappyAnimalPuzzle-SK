//
//  SKButtonNode.m
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/30/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import "SKSpriteButtonNode.h"

@interface SKSpriteButtonNode ()

@property (nonatomic, strong) SKSpriteNode *normalSprite;
@property (nonatomic, strong) SKSpriteNode *selectedSprite;
@property (nonatomic, strong) void (^block)(id sender);

@end


@implementation SKSpriteButtonNode

- (instancetype)initWithNormalSprite:(SKSpriteNode *)normalSprite
                      selectedSprite:(SKSpriteNode *)selectedSprite
                               block:(void(^)(id sender))block {
    self = [super init];
    if (self) {
        self.normalSprite = normalSprite;
        self.selectedSprite = selectedSprite;
        self.block = block;
    }
    return self;
}

+ (instancetype)buttonNodeWithNormalSprite:(SKSpriteNode *)normalSprite
                            selectedSprite:(SKSpriteNode *)selectedSprite
                                     block:(void(^)(id sender))block {
    return [[self alloc] initWithNormalSprite:normalSprite
                               selectedSprite:selectedSprite
                                        block:block];
}

@end

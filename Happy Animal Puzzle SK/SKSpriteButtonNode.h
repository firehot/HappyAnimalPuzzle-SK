//
//  SKButtonNode.h
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/30/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKSpriteButtonNode : SKSpriteNode

+ (instancetype)buttonNodeWithNormalTexture:(SKTexture *)normalTexture
                            selectedTexture:(SKTexture *)selectedTexture
                                      block:(void(^)(id sender))block;

@end

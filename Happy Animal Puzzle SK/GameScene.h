//
//  GameScene.h
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/27/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

+ (instancetype)sceneWithSize:(CGSize)size
                    levelData:(AnimalCategory)category
                  animalIndex:(int)index;

@property (nonatomic, strong) NSArray *puzzleBlocks;
@property (nonatomic) int finishBlockNumber;

@end

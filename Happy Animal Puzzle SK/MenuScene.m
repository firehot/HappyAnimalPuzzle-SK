//
//  MyScene.m
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/27/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import "MenuScene.h"
#import "BookScene.h"
#import "GameScene.h"
#import "LoadingScene.h"

@implementation MenuScene

- (void)createContent {
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"main_menu_bg.png"];
    bg.position = skp(self.centerX, self.centerY);
    [self addChild:bg];
    
    [self createLogo];
    
    SKSpriteButtonNode *farmBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"farm_book.png"]
                                                                  selectedTexture:nil
                                                                            block:^(id sender) {
                                                                                if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                    [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                               waitForCompletion:NO]];
                                                                                }
                                                                                
                                                                                SKTransition *transition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:0.8f];
                                                                                
                                                                                LoadingScene *loadingScene = [LoadingScene sceneWithSize:self.size];
                                                                                [loadingScene setLoadingImage:[UIImage imageNamed:@"Default-Landscape~ipad"]];
                                                                                [loadingScene setLoadingBlock:^{
                                                                                    // load textures
                                                                                    
                                                                                }];
                                                                                [loadingScene setNextScene:[BookScene sceneWithSize:self.size]];
                                                                                
                                                                                [self.view presentScene:loadingScene transition:transition];
                                                                            }];
    farmBtn.position = skp(230, 400);
    [self addChild:farmBtn];
    
    SKSpriteButtonNode *oceanBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"ocean_book.png"]
                                                                  selectedTexture:nil
                                                                            block:^(id sender) {
                                                                                if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                    [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                               waitForCompletion:NO]];
                                                                                }
                                                                                
                                                                                SKTransition *transition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:0.8f];
                                                                                
                                                                                LoadingScene *loadingScene = [LoadingScene sceneWithSize:self.size];
                                                                                [loadingScene setLoadingImage:[UIImage imageNamed:@"Default-Landscape~ipad"]];
                                                                                [loadingScene setLoadingBlock:^{
                                                                                    // load textures
                                                                                    
                                                                                }];
                                                                                [loadingScene setNextScene:[BookScene sceneWithSize:self.size]];
                                                                                
                                                                                [self.view presentScene:loadingScene transition:transition];
                                                                            }];
    oceanBtn.position = skp(790, 400);
    [self addChild:oceanBtn];
    
    SKSpriteButtonNode *grassBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"grass_book.png"]
                                                                  selectedTexture:nil
                                                                            block:^(id sender) {
                                                                                if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                    [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                               waitForCompletion:NO]];
                                                                                }
                                                                                
                                                                                SKTransition *transition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:0.8f];
                                                                                
                                                                                LoadingScene *loadingScene = [LoadingScene sceneWithSize:self.size];
                                                                                [loadingScene setLoadingImage:[UIImage imageNamed:@"Default-Landscape~ipad"]];
                                                                                [loadingScene setLoadingBlock:^{
                                                                                    // load textures
                                                                                    
                                                                                }];
                                                                                [loadingScene setNextScene:[BookScene sceneWithSize:self.size]];
                                                                                
                                                                                [self.view presentScene:loadingScene transition:transition];
                                                                            }];
    grassBtn.position = skp(510, 400);
    [self addChild:grassBtn];
    
    SKSpriteButtonNode *soundBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"sound.png"]
                                                                   selectedTexture:nil
                                                                             block:^(id sender) {
                                                                                 
                                                                             }];
    soundBtn.position = skp(150, 110);
    [self addChild:soundBtn];
    
    SKSpriteButtonNode *parentBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"parent.png"]
                                                                   selectedTexture:nil
                                                                             block:^(id sender) {
                                                                                 
                                                                             }];
    parentBtn.position = skp(self.winSize.width - 150, 110);
    [self addChild:parentBtn];
    
    SKSpriteButtonNode *rateBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"review.png"]
                                                                    selectedTexture:nil
                                                                              block:^(id sender) {
                                                                                  [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                             waitForCompletion:NO]];
                                                                                  
//                                                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Love HappyAnimalPuzzle?"
//                                                                                                                                  message:@"Give us ★★★★★ "
//                                                                                                                                 delegate:self
//                                                                                                                        cancelButtonTitle:@"No, Thanks"
//                                                                                                                        otherButtonTitles:@"Rate Now", nil];
//                                                                                  [alert show];
//                                                                                  alert.tag = kRateAlertTag;
                                                                              }];
    rateBtn.position = skp(self.winSize.width*0.5, 110);
    [self addChild:rateBtn];
}

- (void)loadResource {
    SKTextureAtlas *OtherAtlas = [SKTextureAtlas atlasNamed:@"Others.atlas"];
//    SKTextureAtlas *BookMenu1Atlas = [SKTextureAtlas atlasNamed:@"BookMenu1.atlas"];
//    SKTextureAtlas *BookMenu2Atlas = [SKTextureAtlas atlasNamed:@"BookMenu2.atlas"];
//    SKTextureAtlas *BookMenu3Atlas = [SKTextureAtlas atlasNamed:@"BookMenu3.atlas"];
//    
//    SKTextureAtlas *Animal_0_0Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_0.atlas"];
//    SKTextureAtlas *Animal_0_1Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_1.atlas"];
//    SKTextureAtlas *Animal_0_2Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_2.atlas"];
//    SKTextureAtlas *Animal_0_3Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_3.atlas"];
//    SKTextureAtlas *Animal_0_4Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_4.atlas"];
//    SKTextureAtlas *Animal_0_5Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_5.atlas"];
//    SKTextureAtlas *Animal_1_0Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_0.atlas"];
//    
//    SKTextureAtlas *Animal_1_1Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_1.atlas"];
//    SKTextureAtlas *Animal_1_2Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_2.atlas"];
//    SKTextureAtlas *Animal_1_3Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_3.atlas"];
//    SKTextureAtlas *Animal_1_4Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_4.atlas"];
//    SKTextureAtlas *Animal_1_5Atlas = [SKTextureAtlas atlasNamed:@"Animal_0_5.atlas"];
//    
//    SKTextureAtlas *Animal_2_0Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_0.atlas"];
//    SKTextureAtlas *Animal_2_1Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_1.atlas"];
//    SKTextureAtlas *Animal_2_2Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_2.atlas"];
//    SKTextureAtlas *Animal_2_3Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_3.atlas"];
//    SKTextureAtlas *Animal_2_4Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_4.atlas"];
//    SKTextureAtlas *Animal_2_5Atlas = [SKTextureAtlas atlasNamed:@"Animal_2_5.atlas"];
    
    NSDate *now = [NSDate date];
    
    [SKTextureAtlas preloadTextureAtlases:@[OtherAtlas]
                    withCompletionHandler:^{
                        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:now];
                        NSLog(@"load texture time : %f", interval);
                    }];
}

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        [self loadResource];
    }
    return self;
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

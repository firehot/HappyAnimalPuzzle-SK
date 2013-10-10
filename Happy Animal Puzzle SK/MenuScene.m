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
#import "AppDelegate.h"
#import "MyIAPHelper.h"

#define kRateAlertTag 1
#define kParentAlertTag 2

#define kLogoTag 100

@interface MenuScene ()

@property (nonatomic) BOOL contentCreated;

@end

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
                                                                                
                                                                                SKTransition *transition = [SKTransition fadeWithDuration:0.8f];
                                                                                [self.view presentScene:[BookScene sceneWithSize:self.size animalCategory:kAnimalCategoryFarm]
                                                                                             transition:transition];
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
                                                                                
                                                                                SKTransition *transition = [SKTransition fadeWithDuration:0.8f];
                                                                                [self.view presentScene:[BookScene sceneWithSize:self.size animalCategory:kAnimalCategoryOcean]
                                                                                             transition:transition];
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
                                                                                
                                                                                SKTransition *transition = [SKTransition fadeWithDuration:0.8f];
                                                                                [self.view presentScene:[BookScene sceneWithSize:self.size animalCategory:kAnimalCategoryGrass]
                                                                                             transition:transition];
                                                                            }];
    grassBtn.position = skp(510, 400);
    [self addChild:grassBtn];
    
    SKSpriteButtonNode *soundBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"sound.png"]
                                                                   selectedTexture:nil
                                                                             block:^(id sender) {
                                                                                 if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                     [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                                waitForCompletion:NO]];
                                                                                 }
                                                                                 
                                                                                 
                                                                             }];
    soundBtn.position = skp(150, 110);
    [self addChild:soundBtn];
    
    SKSpriteButtonNode *parentBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"parent.png"]
                                                                   selectedTexture:nil
                                                                             block:^(id sender) {
                                                                                 if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                     [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                                waitForCompletion:NO]];
                                                                                 }
                                                                                 
                                                                                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upgrade to full version"
                                                                                                                                 message:@"Upgrade to full version to play all puzzles and remove ad banner forever!"
                                                                                                                                delegate:self
                                                                                                                       cancelButtonTitle:@"No, Thanks"
                                                                                                                       otherButtonTitles:@"OK", @"I've already bought!", nil];
                                                                                 [alert show];
                                                                                 alert.tag = kParentAlertTag;
                                                                             }];
    parentBtn.position = skp(self.winSize.width - 150, 110);
    [self addChild:parentBtn];
    
    SKSpriteButtonNode *rateBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"review.png"]
                                                                    selectedTexture:nil
                                                                              block:^(id sender) {
                                                                                  if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                      [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                                 waitForCompletion:NO]];
                                                                                  }
                                                                                  
                                                                                  
                                                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Love HappyAnimalPuzzle?"
                                                                                                                                  message:@"Give us ★★★★★ "
                                                                                                                                 delegate:self
                                                                                                                        cancelButtonTitle:@"No, Thanks"
                                                                                                                        otherButtonTitles:@"Rate Now", nil];
                                                                                  [alert show];
                                                                                  alert.tag = kRateAlertTag;
                                                                              }];
    rateBtn.position = skp(self.winSize.width*0.5, 110);
    [self addChild:rateBtn];
}

- (void)loadResource {
    SKTextureAtlas *OtherAtlas = [SKTextureAtlas atlasNamed:@"Others.atlas"];
    
    [SKTextureAtlas preloadTextureAtlases:@[OtherAtlas]
                    withCompletionHandler:^{
                        
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
    if (!self.contentCreated) {
        self.contentCreated = YES;
        [self createContent];
    }
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
    
    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction waitForDuration:4 withRange:2.5],
                                                                       [SKAction performSelector:@selector(playEyeAnimate) onTarget:self]]]]];
}

- (void)playEyeAnimate {
    SKSpriteNode *logo = (SKSpriteNode *)[self childNodeWithName:@"logo"];
    for (SKSpriteNode *eye in logo.children) {
        NSMutableArray *textures = [NSMutableArray array];
        for (int i = 0; i != 2; i++) {
            NSString *textureName = [NSString stringWithFormat:@"eye_%d.png", i];
            SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
            [textures addObject:texture];
        }
        [eye runAction:[SKAction repeatAction:[SKAction animateWithTextures:textures timePerFrame:0.15f]
                                        count:2]];
    }
}

- (void)dealloc {
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == kRateAlertTag) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            NSString *url = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", @"663789982"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        }
    }
    else if (alertView.tag == kParentAlertTag) {
        if (buttonIndex != alertView.cancelButtonIndex) {
            if (buttonIndex == alertView.firstOtherButtonIndex) {
                [[MyIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
                    if (products.count == 1) {
                        SKProduct *product = [products objectAtIndex:0];
                        [[MyIAPHelper sharedInstance] buyProduct:product];
                    }
                }];
            }
            else {
                [[MyIAPHelper sharedInstance] restoreCompletedTransactions];
            }
        }
    }
}

@end

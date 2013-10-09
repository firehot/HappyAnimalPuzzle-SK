//
//  GameScene.m
//  Happy Animal Puzzle SK
//
//  Created by scnfex on 9/27/13.
//  Copyright (c) 2013 MopCat Games. All rights reserved.
//

#import "GameScene.h"

#import "MenuScene.h"
#import "PuzzleBlock.h"
#import "BookScene.h"
#import "LoadingScene.h"
#import "MyIAPHelper.h"

#define kFadeDuration 1.0f
#define kParticleTag 100

@interface GameScene ()

@property (nonatomic, assign) int animalIndex;
@property (nonatomic, assign) int animalCategory;
@property (nonatomic, strong) SKNode *backgroundLayer;
@property (nonatomic, strong) SKNode *menuLayer;
@property (nonatomic, strong) SKNode *puzzleLayer;
@property (nonatomic, strong) SKSpriteNode *puzzlePicture;

@property (nonatomic, strong) SKSpriteButtonNode *level1Btn;
@property (nonatomic, strong) SKSpriteButtonNode *level2Btn;
@property (nonatomic, strong) SKSpriteButtonNode *level3Btn;
@property (nonatomic, strong) SKSpriteButtonNode *nextBtn;
@property (nonatomic, assign) LevelType currnetLevel;

@property (nonatomic, strong) SKSpriteNode *woodBlock;
@property (nonatomic, assign) BOOL isGameFinish;
@property (nonatomic, assign) int blockNum;
@property (nonatomic, assign) BOOL isGameStart;
@property (nonatomic, assign) BOOL selectLevel;

@end

@implementation GameScene

- (void)loadTextures {
    
    SKTextureAtlas *othersAtlas = [SKTextureAtlas atlasNamed:@"Others.atlas"];
    SKTextureAtlas *animalAtlas = [SKTextureAtlas atlasNamed:[NSString stringWithFormat:@"Animal_%d_%d.atlas",
                                                              self.animalCategory, self.animalIndex]];
    
    [SKTexture preloadTextures:@[othersAtlas, animalAtlas]
         withCompletionHandler:^{
             
         }];
}

- (instancetype)initWithSize:(CGSize)size
                   levelData:(AnimalCategory)category
                 animalIndex:(int)index {
    self = [super initWithSize:size];
    if (self) {
        self.animalCategory = category;
        self.animalIndex = index;
        
        [self loadTextures];
        
        self.backgroundLayer = [SKNode node];
        [self addChild:self.backgroundLayer];
        self.backgroundLayer.zPosition = 0;
        
        self.puzzleLayer = [SKNode node];
        [self addChild:self.puzzleLayer];
        self.puzzleLayer.zPosition = 1;
        
        self.menuLayer = [SKNode node];
        [self addChild:self.menuLayer];
        self.menuLayer.zPosition = 2;
        
        [self initBackground];
    }
    return self;
}

+ (instancetype)sceneWithSize:(CGSize)size
                    levelData:(AnimalCategory)category
                  animalIndex:(int)index {
    return [[self alloc] initWithSize:size levelData:category animalIndex:index];
}

- (void)playButtonAnimation:(SKNode *)button {
    id a1 = [SKAction scaleTo:1.3f duration:0.2f];
    id a2 = [SKAction scaleTo:0.8f duration:0.2f];
    id a3 = [SKAction scaleTo:1.1f duration:0.2f];
    id a4 = [SKAction scaleTo:1.0f duration:0.2f];
    
    [button runAction:[SKAction sequence:@[a1, a2, a3, a4]]];
}

- (void)initButtons {
    SKSpriteButtonNode *closeBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"back_btn.png"]
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
    closeBtn.position = skp(50, 50);
    [self addChild:closeBtn];

    SKSpriteButtonNode *homeBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"home_btn.png"]
                                                                   selectedTexture:nil
                                                                             block:^(id sender) {
                                                                                 if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                     [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                                waitForCompletion:NO]];
                                                                                 }
                                                                                 
                                                                                 SKTransition *transition = [SKTransition fadeWithDuration:0.8f];
                                                                                 [self.view presentScene:[MenuScene sceneWithSize:self.size]
                                                                                              transition:transition];
                                                                             }];
    homeBtn.position = skp(50, 150);
    [self addChild:homeBtn];
    
    
    self.level1Btn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"level1_btn.png"]
                                                                  selectedTexture:nil
                                                                            block:^(id sender) {
                                                                                if ([Utility sharedUtility].isSoundAvaliable) {
                                                                                    [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                               waitForCompletion:NO]];
                                                                                }
                                                                                
                                                                                [self playLevel:kLevelType2x2];
                                                                            }];
    self.level1Btn.position = skp(900, 350);
    [self addChild:self.level1Btn];
    self.level1Btn.scale = 0;
    
    self.level2Btn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"level2_btn.png"]
                                                     selectedTexture:nil
                                                               block:^(id sender) {
                                                                   if ([Utility sharedUtility].isSoundAvaliable) {
                                                                       [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                                  waitForCompletion:NO]];
                                                                   }
                                                                   
                                                                   [self playLevel:kLevelType3x2];
                                                               }];
    self.level2Btn.position = skp(900, 250);
    self.level2Btn.scale = 0;
    
    self.level3Btn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"level3_btn.png"]
                                             selectedTexture:nil
                                                      block:^(id sender) {
                                                          if ([Utility sharedUtility].isSoundAvaliable) {
                                                              [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                         waitForCompletion:NO]];
                                                          }
                                                          
                                                          [self playLevel:kLevelType3x3];
                                                      }];
    self.level3Btn.position = skp(900, 150);
    self.level3Btn.scale = 0;
    
    self.nextBtn = [SKSpriteButtonNode buttonNodeWithNormalTexture:[SKTexture textureWithImageNamed:@"next_btn.png"]
                                           selectedTexture:nil
                                                    block:^(id sender) {
                                                        if ([Utility sharedUtility].isSoundAvaliable) {
                                                            [self runAction:[SKAction playSoundFileNamed:kSoundEffectClick
                                                                                       waitForCompletion:NO]];
                                                        }
                                                        
                                                        
                                                        if (!self.nextBtn.paused) {
                                                            [self.nextBtn removeAllActions];
                                                            self.nextBtn.scale = 1.0f;
                                                        }
                                                        
                                                        [self playNextAnimal];
                                                    }];
    self.nextBtn.position = skp(self.winSize.width-50, 50);
    self.nextBtn.alpha = 0;
    
    [self.menuLayer addChild:closeBtn];
    [self.menuLayer addChild:homeBtn];
    [self.menuLayer addChild:self.level1Btn];
    [self.menuLayer addChild:self.level2Btn];
    [self.menuLayer addChild:self.level3Btn];
    [self.menuLayer addChild:self.nextBtn];
    
    // animations
    [self playButtonAnimation:self.level1Btn];
    [self performSelector:@selector(playButtonAnimation:) withObject:self.level2Btn afterDelay:0.3f];
    [self performSelector:@selector(playButtonAnimation:) withObject:self.level3Btn afterDelay:0.6f];
    
    self.selectLevel = YES;
}

- (void)didMoveToView:(SKView *)view {
    [self initButtons];
}

- (void)initBackground {
    UIColor *color;
    NSString *patternFile;
    
    if (self.animalCategory == kAnimalCategoryFarm) {
        color = skColor3(254, 217, 123);
        patternFile = @"bg_pattern_1.png";
    }
    else if (self.animalCategory == kAnimalCategoryGrass) {
        color = skColor3(185, 230, 90);
        patternFile = @"bg_pattern_2.png";
    }
    else if (self.animalCategory == kAnimalCategoryOcean) {
        color = skColor3(98, 208, 255);
        patternFile = @"bg_pattern_3.png";
    }
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithColor:color
                                                    size:self.size];
    background.position = skp(self.centerX, self.centerY);
    [self.backgroundLayer addChild:background];
    
    SKSpriteNode *pattern = [SKSpriteNode spriteNodeWithImageNamed:patternFile];
    pattern.position = skp(self.centerX, self.centerY);
    [self.backgroundLayer addChild:pattern];
    
    self.woodBlock = [SKSpriteNode spriteNodeWithImageNamed:@"puzzle_bg.png"];
    self.woodBlock.position = skp(self.centerX, 319);
    self.woodBlock.zPosition = 0;
    [self.backgroundLayer addChild:self.woodBlock];
    
    NSString *file = [NSString stringWithFormat:@"animal_%d_%d.png", self.animalCategory, self.animalIndex];
    self.puzzlePicture = [SKSpriteNode spriteNodeWithImageNamed:file];
    self.puzzlePicture.position = skp(self.centerX-2, 320);
    [self.backgroundLayer addChild:self.puzzlePicture];
}

- (void)moveBlocks {
    for (PuzzleBlock *block in self.puzzleBlocks) {
        float width = block.size.width;
        float height = block.size.height;
        
        float randomX = randomBetween(width*0.5, self.size.width-width*0.5);
        float randomY = randomBetween(height*0.5, self.size.height - height*0.5);
        
        SKAction *move = [SKAction moveTo:skp(randomX, randomY) duration:0.5f];
        [block runAction:move];
    }
}

- (void)startParticle {
//    CCParticleSystem *particle = [[CCParticleSystemQuad alloc] initWithTotalParticles:50];
//    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"particle_star.png"];
//    particle.texture = texture;
//    particle.emissionRate = 30;
//    particle.angle = 90.0;
//    particle.angleVar = 5.0;
//    ccBlendFunc blendFunc = {GL_SRC_ALPHA, GL_ONE};
//    particle.blendFunc = blendFunc;
//    particle.duration = -1.00;
//    particle.emitterMode = kCCParticleModeGravity;
//    ccColor4F starColor = {0.7, 0.8, 1.0, 1.0};
//    particle.startColor = starColor;
//    ccColor4F starColorVar = {0.14, 0.14, 0.14, 0.5};
//    particle.startColorVar = starColorVar;
//    ccColor4F endColor = {0.7, 0.8, 1.0, 0.0};
//    particle.endColor = endColor;
//    ccColor4F endColorVar = {0.42, 0.47, 0.47, 0.43};
//    particle.endColorVar = endColorVar;
//    particle.startSize = 15.0;
//    particle.startSizeVar = 15.0;
//    particle.endSize = -1;
//    particle.totalParticles = 50;
//    particle.life = 3;
//    particle.lifeVar = 2;
//    particle.position = self.woodBlock.position;
//    particle.posVar = ccp(self.woodBlock.contentSize.width*0.5 - 20,
//                          self.woodBlock.contentSize.height*0.5 - 20);
//    [self.menuLayer addChild:particle z:0 tag:kParticleTag];
}

- (void)addAnimalTitle {
    NSArray *titles = [NSArray arrayWithObjects:
                       @"SHEEP",
                       @"PIG",
                       @"HORSE",
                       @"COW",
                       @"DOG",
                       @"CAT",
                       @"GIRAFFE",
                       @"ZEBRA",
                       @"LION",
                       @"ELEPHANT",
                       @"HIPPO",
                       @"MONKEY",
                       @"SEA LION",
                       @"CETACEAN",
                       @"PENGUIN",
                       @"POLAR BEAR",
                       @"REINDEER",
                       @"TIGER WHALE",
                       nil];
    int index = self.animalCategory * 6 + self.animalIndex;
    NSString *title = [titles objectAtIndex:index];
    
    float totalWidth = 0.0f;
    float f = 5.0f;
    NSMutableArray *characters = [NSMutableArray arrayWithCapacity:title.length];
    
    for (int i = 0; i != title.length; i++) {
        NSString *c = [title substringWithRange:NSMakeRange(i, 1)];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Shark Soft Bites"];
        label.fontSize = 100;
        label.text = c;
        label.position = skp(self.centerX, self.size.height - 150);
        [self.puzzleLayer addChild:label];
        
        if (self.animalCategory == kAnimalCategoryFarm) {
            label.fontColor = skColor3(255, 156, 0);
        }
        else if (self.animalCategory == kAnimalCategoryGrass) {
            label.fontColor = skColor3(99, 192, 0);
        }
        else {
            label.fontColor = skColor3(0, 168, 255);
        }
        
        totalWidth += label.frame.size.width + f*2;
        [characters addObject:label];
        
        label.scale = 0.01;
        
        id a1 = [SKAction scaleTo:1.3f duration:0.2f];
        id a2 = [SKAction scaleTo:0.8f duration:0.2f];
        id a3 = [SKAction scaleTo:1.1f duration:0.2f];
        id a4 = [SKAction scaleTo:1.0f duration:0.2f];
        id a5 = [SKAction waitForDuration:i*0.2f];
        id a6 = [SKAction sequence:@[a5, a1,a2,a3,a4]];
        [label runAction:a6];
    }
    
    float temp = 0.0f;
    for (int i = 0; i != title.length; i++) {
        SKLabelNode *label = [characters objectAtIndex:i];
        
        float width = label.frame.size.width;
        
        label.position = skp(self.size.width*0.5 - totalWidth*0.5 + temp, self.size.height - 150);
        temp += width + f*2;
    }
}

- (void)gameFinish {
    if (!self.isGameFinish && self.isGameStart) {
        self.isGameFinish = YES;
        self.isGameStart = NO;
        
        if ([Utility sharedUtility].isSoundAvaliable) {
            [self runAction:[SKAction playSoundFileNamed:kSoundEffectFinish
                                       waitForCompletion:NO]];
        }
        
        [self.puzzlePicture runAction:[SKAction fadeInWithDuration:kFadeDuration]];
        
        for (PuzzleBlock *block in self.puzzleBlocks) {
            [block runAction:[SKAction fadeOutWithDuration:kFadeDuration]];
        }
        
        [self startParticle];
        [self addAnimalTitle];
        
        [self.nextBtn runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction scaleTo:1.5f duration:0.3f],
                                                                                   [SKAction scaleTo:1.0f duration:0.3f]]]]];
    }
}

- (void)update:(NSTimeInterval)currentTime {
    if (self.finishBlockNumber == self.blockNum) {
        [self gameFinish];
    }
}

- (void)playLevel:(LevelType)level {
    
}

- (void)playNextAnimal {
    
}

@end

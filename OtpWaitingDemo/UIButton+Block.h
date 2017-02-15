//
//  UIButton+Block.h
// KLBank
//
//  Created by Parity on 14-8-15.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
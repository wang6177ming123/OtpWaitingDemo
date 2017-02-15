//
//  UIButton+Block.m
// KLBank
//
//  Created by Parity on 14-8-15.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)

static char overviewKey;

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    if (block) {
        objc_removeAssociatedObjects(self);
        
        objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
    }
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end

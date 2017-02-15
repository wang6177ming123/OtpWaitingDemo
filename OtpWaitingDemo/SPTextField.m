//
//  SPTextField.m
// KLBank
//
//  Created by Parity on 14-7-28.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

#import "SPTextField.h"
#import "SPRegExMode.h"
#import "SPAlertMode.h"

@interface SPTextField ()

@property (nonatomic, weak) UIViewController *vc;
@end

@implementation SPTextField

-(instancetype)init{
    self = [super init];
    if (self) {
        _pasteEnable = NO;
        [self removeTarget:self action:@selector(textFieldCheckValue) forControlEvents:UIControlEventEditingDidEnd];
        [self addTarget:self action:@selector(textFieldCheckValue) forControlEvents:UIControlEventEditingDidEnd];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _pasteEnable = NO;
        [self removeTarget:self action:@selector(textFieldCheckValue) forControlEvents:UIControlEventEditingDidEnd];
        [self addTarget:self action:@selector(textFieldCheckValue) forControlEvents:UIControlEventEditingDidEnd];
    }
    return self;
}
-(void)dealloc{
    [self removeTarget:self action:@selector(textFieldCheckValue) forControlEvents:UIControlEventEditingDidEnd];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
        if (!_pasteEnable) {
            return NO;
        }
    return [super canPerformAction:action withSender:sender];
}

-(void)textFieldCheckValue{
    if (!_vc) {
        _vc = [SPAlertMode getCurrentVC];
    }

}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length == 0) {
        return YES;
    }
    
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

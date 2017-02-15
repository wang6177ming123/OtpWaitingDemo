//
//  SPWattingButton.m
//  AAA
//
//  Created by Parity on 14-8-7.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

#import "SPWattingButton.h"

@interface SPWattingButton ()

@property (nonatomic, assign) NSInteger time;

@property (nonatomic, strong) NSString *normalTitle;
@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *normalBackColor;

@end

@implementation SPWattingButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _runTitleColor = [UIColor whiteColor];
        _runBackColor = [UIColor grayColor];
    }
    
    return self;
}

- (void)beginTimer
{
    self.userInteractionEnabled = NO;
    _normalBackColor = self.backgroundColor;
    _normalTitle = [self titleForState:UIControlStateNormal];
    _normalTitleColor = [self titleColorForState:UIControlStateNormal];
    
    self.titleLabel.textColor = _runTitleColor;
    [self setTitleColor:_runTitleColor forState:UIControlStateNormal];
    self.backgroundColor = _runBackColor;
    
    _time = 90;
    _isOver = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(wattingButton:WillBeginTimer:)]) {
        [_delegate wattingButton:self WillBeginTimer:YES];
    }
    [self setTitleColor:_runTitleColor? _runTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.userInteractionEnabled = NO;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(_time<=0 || _isOver){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                _timeStart = NO;
                self.titleLabel.textColor = _normalTitleColor;
                self.backgroundColor = _normalBackColor;
                self.userInteractionEnabled = YES;
                [self setTitle:_normalTitle forState:UIControlStateNormal];
                [self setTitleColor:_normalTitleColor forState:UIControlStateNormal];
        
                if (_delegate && [_delegate respondsToSelector:@selector(wattingButton:WillEndTimer:)]) {
                    [_delegate wattingButton:self WillEndTimer:NO];
                }
            });
        }else{
            _time --;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"(%ld)重新获取",(long)_time] forState:UIControlStateNormal];
            });
        }
    });
    //
    dispatch_resume(_timer);
    _timeStart = YES;
}

- (void)stoptimer
{
    _isOver = YES;
    _timeStart = NO;
}

- (void)refreshTimer
{
    _time = 60;
    _isOver = NO;
    _timeStart = YES;
}


@end

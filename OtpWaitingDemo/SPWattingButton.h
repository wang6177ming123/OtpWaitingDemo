//
//  SPWattingButton.h
//  AAA
//
//  Created by Parity on 14-8-7.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPWattingButton;

@protocol SPWattingButtonDelegate <NSObject>

@optional
//please remember invalidate timer when push
- (void) wattingButton:(SPWattingButton *)wBtn WillBeginTimer:(BOOL)isTimeOn;
- (void) wattingButton:(SPWattingButton *)wBtn WillEndTimer:(BOOL)isTimeOn;

@end


@interface SPWattingButton : UIButton

@property (nonatomic, strong) dispatch_source_t timer ;

@property (nonatomic, assign) BOOL timeStart;
@property (nonatomic, assign) BOOL isOver;
@property (nonatomic, assign) id<SPWattingButtonDelegate>delegate;

@property (nonatomic, copy) NSString *wattingTitle;
@property (nonatomic, strong) UIColor *runBackColor;
@property (nonatomic, strong) UIColor *runTitleColor;

- (void)beginTimer;
- (void)stoptimer;
- (void)refreshTimer;

@end

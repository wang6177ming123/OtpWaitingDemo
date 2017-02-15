//
//  SPTextField.h
// KLBank
//
//  Created by Parity on 14-7-28.
//  Copyright (c) 2014年 pactera. All rights reserved.
//

//typedef enum {
//    Input_UserName = 0,
//    Input_LoginPassword = 1,
//    Input_TransPassword = 2,
//    Input_CN = 3,
//    Input_Cert = 4,
//    Input_TelePhone = 5,
//    Input_MobilePhone = 6,
//    Input_Amt = 7,
//    Input_Email = 8,
//    Input_Address = 9,
//    Input_Job = 10,
//    Input_Otp = 11
//}InputType;


#import <UIKit/UIKit.h>
#import "ESTextField.h"

@interface SPTextField : UITextField

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSString * rememberAccount;
@property (nonatomic, assign) BOOL pasteEnable;
//@property (nonatomic, assign) InputType inputType;
@end

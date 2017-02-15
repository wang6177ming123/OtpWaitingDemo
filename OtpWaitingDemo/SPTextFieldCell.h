//
//  SPTextFieldCell.h
//   KLBank
//
//  Created by Pactera on 15/12/11.
//  Copyright © 2015年 pactera. All rights reserved.
//

typedef enum{
    NoPasswordTextfield = 0,
    NormalPasswordTextfield,
    PinPasswordTextfield,
}PasswordType;

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
#define kPadding 0
#define TitleLabelWidth 80*W/375
#define TitleLeftOrgin 15


#import <UIKit/UIKit.h>


@interface SPTextFieldCell : UITableViewCell

@property (nonatomic, strong) UITextField *textField;


@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *font;

-(void)setSubFrame;

@end

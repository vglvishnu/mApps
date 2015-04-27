//
//  VGSetPasswordViewController.h
//  Dragon
//
//  Created by Vishnu on 4/26/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGSetPasswordViewController : UIViewController <UITextFieldDelegate>
    @property (nonatomic) UIView *setPasswordSubView;
    @property (nonatomic) UITextField *setPasswordTextField;
    @property (nonatomic) UITextField *setPasswordConfirmTextField;
    @property (nonatomic) UIButton *setPasswordNextButton;

 - (id)initWithParentView:(UIView *)parentView;
 - (id)initWithFrame:(CGRect )cgRect;
- (id)initWithSize:(CGSize )cgSize parentOrigin:(CGPoint) parentOrigin;
@end

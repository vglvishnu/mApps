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
    @property (nonatomic) UITextField *passwordTextField;
    @property (nonatomic) UITextField *passwordConfirmTextField;
    @property (nonatomic) UITextField *hintTextField;
    @property (nonatomic) UIButton *nextButton;

@end

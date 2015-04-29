//
//  VGPassWordTextFieldDelegate.h
//  Dragon
//
//  Created by Vishnu on 4/28/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGPassWordTextFieldDelegate : UIView <UITextFieldDelegate>
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string ;
@end

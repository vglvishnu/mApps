//
//  VGPassWordTextFieldDelegate.m
//  Dragon
//
//  Created by Vishnu on 4/28/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGPassWordTextFieldDelegate.h"

@implementation VGPassWordTextFieldDelegate

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    // Enable/disable the button depending on the length of the text
        
    NSLog(@"Strength %f", [self calculateStrength:textField.text]);
    
        //self.passwordStrength.Progress=self.progressPercentage;
    return (newLength > 0)? YES:NO;
}

- (CGFloat) calculateStrength:(NSString *)string  {
    if (!string || [string length] == 0) {
        return 0.0f;
    }
    
    __block BOOL includesLowercaseCharacter = NO, includesUppercaseCharacter = NO, includesDecimalDigitCharacter = NO, includesPunctuationCharacter = NO, includesSymbolCharacter = NO, includesWhitespaceCharacter = NO, includesNonBaseCharacter = NO;
    __block NSUInteger sizeOfCharacterSet = 0;
    
    NSCountedSet *characterFrequency = [[NSCountedSet alloc] initWithCapacity:[string length]];
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        {
            if (!includesLowercaseCharacter && [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesLowercaseCharacter = YES;
                sizeOfCharacterSet += 26;
                goto next;
            }
            
            if (!includesUppercaseCharacter && [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesLowercaseCharacter = YES;
                sizeOfCharacterSet += 26;
                goto next;
            }
            
            if (!includesDecimalDigitCharacter && [[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesDecimalDigitCharacter = YES;
                sizeOfCharacterSet += 10;
                goto next;
            }
            
            if (!includesSymbolCharacter && [[NSCharacterSet symbolCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesSymbolCharacter = YES;
                sizeOfCharacterSet += 10;
                goto next;
            }
            
            if (!includesPunctuationCharacter && [[NSCharacterSet punctuationCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesPunctuationCharacter = YES;
                sizeOfCharacterSet += 20;
                goto next;
            }
            
            if (!includesWhitespaceCharacter && [[NSCharacterSet whitespaceCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesWhitespaceCharacter = YES;
                sizeOfCharacterSet += 1;
                goto next;
            }
            
            if (!includesNonBaseCharacter && [[NSCharacterSet nonBaseCharacterSet] characterIsMember:[substring characterAtIndex:0]]) {
                includesNonBaseCharacter = YES;
                sizeOfCharacterSet += 32 + 128;
                goto next;
            }
        }
    next: {
        [characterFrequency addObject:substring];
    }
    }];
    
    CGFloat entropyPerCharacter = log2f(sizeOfCharacterSet);
    
    return entropyPerCharacter * [string length];
}


@end

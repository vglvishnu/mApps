//
//  VGSetPasswordViewController.m
//  Dragon
//
//  Created by Vishnu on 4/26/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGSetPasswordViewController.h"
#import "VGPassWordTextFieldDelegate.h"

@interface VGSetPasswordViewController ()

@property (nonatomic) UIView *parentView;
@property (nonatomic) UIProgressView *passwordStrength;
@property (nonatomic) CGFloat progressPercentage;

@end

@implementation VGSetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureSetPassWordView:self.view];

    
}

- (id)initWithParentView:(UIView *)parentView
{
    VGSetPasswordViewController* id = [super init];
    self.parentView = parentView;
    
    CGRect applicationFrame = self.parentView.frame;
  //  NSLog(@"Page View size %@",applicationFrame.origin.x);
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    
    //contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;

   
    return id;
 
}

- (id)initWithFrame:(CGRect )cgRect
{
    VGSetPasswordViewController* id = [super init];
    UIView *contentView = [[UIView alloc] initWithFrame:cgRect];
    
    self.view = contentView;
    return id;
    
}

- (id)initWithSize:(CGSize )cgSize parentOrigin:(CGPoint) parentOrigin
{
    VGSetPasswordViewController* id = [super init];
    CGRect parentRect = CGRectMake(cgSize.height, cgSize.width, cgSize.width,cgSize.height);
    UIView *contentView = [[UIView alloc] initWithFrame:parentRect];
    
    self.view = contentView;
    return id;
    
}

-(void) configureSetPassWordView:(UIView *) parentView {
     CGSize parentViewSize = parentView.frame.size;
    
    
    //Set password text field
    [parentView setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                           ((parentViewSize.height)/7.5 - 28), parentViewSize.width -70, 28)];
    [self.passwordTextField setPlaceholder:@"password"];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.passwordTextField setBackgroundColor:[UIColor colorWithRed:64 green:64 blue:64 alpha:0]];
    [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.passwordTextField setBackgroundColor:[UIColor whiteColor]];
    //TODO : Plan the delegate well.
    [self.passwordTextField setDelegate:self];
   
    
    //Set progress bar
    self.progressPercentage = 0.0f;
    self.passwordStrength = [[UIProgressView alloc] init];
    self.passwordStrength.frame = CGRectMake(20, self.passwordTextField.frame.origin.y + 53, parentViewSize.width -70, 7);
    self.passwordStrength.Progress=self.progressPercentage;
    [self.passwordStrength setProgressViewStyle:UIProgressViewStyleBar];
    [self.passwordStrength setTrackTintColor:[UIColor grayColor]];
    //[self.passwordStrength setTintColor:[UIColor redColor]];
    //[self.passwordStrength setBackgroundColor:[UIColor greenColor]];
    self.passwordStrength.layer.cornerRadius = 7;
    
    
    
    
    // confirm password text field
    self.passwordConfirmTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                              ((parentViewSize.height)/4 - 28), parentViewSize.width -70, 28)];
    [self.passwordConfirmTextField setPlaceholder:@"confirm password"];
    [self.passwordConfirmTextField setSecureTextEntry:YES];
    [self.passwordConfirmTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
    [self.passwordConfirmTextField setBorderStyle:UITextBorderStyleRoundedRect];
    //[self.passwordConfirmTextField setDelegate:self];
    [self.passwordConfirmTextField setBackgroundColor:[UIColor whiteColor]];
   
    
    // Hint text field
    self.hintTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                                     ((parentViewSize.height)/3 - 28), parentViewSize.width -70, 28)];
    [self.hintTextField setPlaceholder:@"Hint Answer"];
    [self.hintTextField setSecureTextEntry:YES];
    [self.hintTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
    [self.hintTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.hintTextField setBackgroundColor:[UIColor whiteColor]];
    
    
    //Next button
    
    self.nextButton =  [UIButton  buttonWithType:UIButtonTypeRoundedRect];
    self.nextButton.layer.cornerRadius = 5;
    [self.nextButton setFrame:CGRectMake(self.hintTextField.center.x - 30 , self.hintTextField.center.y + 50 , 50, 28)];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextButton setBackgroundColor:[UIColor colorWithRed: 99.0/255.0 green: 184.0/255.0 blue:255.0/255.0 alpha: 1.0]];
    [self.nextButton setBounds:CGRectMake(self.hintTextField.center.x - 20 , self.hintTextField.center.y + 50 , 50, 28)];
    [self.nextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton setEnabled:NO];
    
    
    [parentView addSubview:self.passwordTextField];
    [parentView addSubview:self.passwordStrength];
    [parentView addSubview:self.passwordConfirmTextField];
    [parentView addSubview:self.hintTextField];
    [parentView addSubview:self.nextButton];
    
    
}

- (void) nextButtonAction {
    
    if (self.passwordTextField.text.length > 0 && self.passwordConfirmTextField.text.length > 0)
    {
        if ([self.passwordTextField.text isEqualToString:self.passwordConfirmTextField.text]){
            //TODO: set pass word confirmed and do the configurations
        }
    }

    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    // Enable/disable the button depending on the length of the text
    if (newLength > 0 && self.passwordTextField.text.length > 0)
        self.nextButton.enabled = YES;
    else
        self.nextButton.enabled = NO;
    
    
     NSLog(@"Strength %f", [self calculateStrength:textField.text]);
    
     [self strengthForEntropy:[self calculateStrength:textField.text]];
    //self.passwordStrength.Progress=self.progressPercentage;
    return (newLength > 0)? YES:NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - CalculateStrength

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

-(void) strengthForEntropy:(CGFloat ) entropy {
    
    if (entropy < 20) {
        
        self.passwordStrength.progress = entropy * .01f;
        self.passwordStrength.tintColor = [UIColor redColor];
    } else if (entropy < 50) {
        
        self.passwordStrength.progress = entropy * .01f;
        self.passwordStrength.tintColor = [UIColor orangeColor];
    } else if (entropy < 60 ) {
        self.passwordStrength.progress = entropy * .01f;
        self.passwordStrength.tintColor = [UIColor yellowColor];
    } else {
        self.passwordStrength.progress = entropy * .01f;
        self.passwordStrength.tintColor = [UIColor greenColor];
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

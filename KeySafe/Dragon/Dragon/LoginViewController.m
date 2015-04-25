//
//  ViewController.m
//  Dragon
//
//  Created by Vishnu on 4/24/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()


@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
    [self configureView:[self view]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) configureView:(UIView*) mainView {
    
    CGSize mainViewSize = mainView.frame.size;
    
    UIColor *lightBlueColor = [UIColor colorWithRed: 100.0/255.0 green: 148.0/255.0 blue:237.0/255.0 alpha: 1.0];
    
    UITextField *passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                                   ((mainViewSize.height)/2 - 28), mainViewSize.width -50, 28)];
    [passWordTextField setPlaceholder:@"password"];
    [passWordTextField setSecureTextEntry:YES];
    
    [passWordTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
    [passWordTextField setBorderStyle:UITextBorderStyleRoundedRect];
   
    
    UIButton   *goButton =  [UIButton  buttonWithType:UIButtonTypeRoundedRect];
    [goButton setFrame:CGRectMake(passWordTextField.center.x - 20 , passWordTextField.center.y + 50 , 50, 28)];
    [goButton setTitle:@"Go" forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goButton setBackgroundColor:lightBlueColor];
    [goButton setBounds:CGRectMake(passWordTextField.center.x - 20 , passWordTextField.center.y + 50 , 50, 28)];
    
    
//    
//    // Width constraint, half of parent view width
//    [mainView addConstraint:[NSLayoutConstraint constraintWithItem:passWordTextField
//                                                         attribute:NSLayoutAttributeWidth
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:mainView
//                                                         attribute:NSLayoutAttributeWidth
//                                                        multiplier:0.5
//                                                          constant:0]];
//    
//    // Height constraint, half of parent view height
//    [mainView addConstraint:[NSLayoutConstraint constraintWithItem:passWordTextField
//                                                         attribute:NSLayoutAttributeHeight
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:mainView
//                                                         attribute:NSLayoutAttributeHeight
//                                                        multiplier:0.5
//                                                          constant:0]];
//    
//    // Center horizontally
//    [mainView addConstraint:[NSLayoutConstraint constraintWithItem:passWordTextField
//                                                         attribute:NSLayoutAttributeCenterX
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:mainView
//                                                         attribute:NSLayoutAttributeCenterX
//                                                        multiplier:1.0
//                                                          constant:0.0]];
//    
//    // Center vertically
//    [mainView addConstraint:[NSLayoutConstraint constraintWithItem:passWordTextField
//                                                         attribute:NSLayoutAttributeCenterY
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:mainView
//                                                         attribute:NSLayoutAttributeCenterY
//                                                        multiplier:1.0
//                                                          constant:0.0]];
//    
    
    
    [mainView addSubview:passWordTextField];
    [mainView addSubview:goButton];
    
    
}

@end

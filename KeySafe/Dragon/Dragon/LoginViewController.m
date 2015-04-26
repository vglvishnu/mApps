//
//  ViewController.m
//  Dragon
//
//  Created by Vishnu on 4/24/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic) IBOutlet UITextField *passWordTextField;
@property (nonatomic) IBOutlet UIButton *goButton;
@property (nonatomic) IBOutlet UIView *settingSubView;

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
    
    UIColor *lightBlueColor = [UIColor colorWithRed: 99.0/255.0 green: 184.0/255.0 blue:255.0/255.0 alpha: 1.0];
    
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DragonPropertiesList" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    BOOL isConfigured = [[dict objectForKey:@"isConfigured"]boolValue];
    NSLog(isConfigured ? @"YES":@"NO");
    
    if(!isConfigured) {
    
        self.settingSubView = [[UIView alloc] init];
    
        [self.settingSubView setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.settingSubView.layer.cornerRadius = 10;
        self.settingSubView.backgroundColor = [UIColor colorWithRed:210.0/255.0 green:245.0/255.0 blue:255.0/255.0 alpha:1.0];
        //self.settingSubView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"#D1EEFC"];
        [mainView addSubview:self.settingSubView];

//    // Width constraint, half of parent view width
        [mainView addConstraint:[NSLayoutConstraint constraintWithItem:self.settingSubView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:mainView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.9
                                                          constant:0]];
    
    // Height constraint, half of parent view height
        [mainView addConstraint:[NSLayoutConstraint constraintWithItem:self.settingSubView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:mainView
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:0.7
                                                          constant:0]];
    
    // Center horizontally
        [mainView addConstraint:[NSLayoutConstraint constraintWithItem:self.settingSubView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:mainView
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
    
    // Center vertically
        [mainView addConstraint:[NSLayoutConstraint constraintWithItem:self.settingSubView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:mainView
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0]];
    
    
        [mainView addSubview:self.settingSubView];
    
    } else {
        
        self.passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                               ((mainViewSize.height)/2 - 28), mainViewSize.width -50, 28)];
        [self.passWordTextField setPlaceholder:@"password"];
        [self.passWordTextField setSecureTextEntry:YES];
        [self.passWordTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
        [self.passWordTextField setBorderStyle:UITextBorderStyleRoundedRect];
        
        
        
        
        self.goButton =  [UIButton  buttonWithType:UIButtonTypeRoundedRect];
        self.goButton.layer.cornerRadius = 5;
        [self.goButton setFrame:CGRectMake(self.passWordTextField.center.x - 20 , self.passWordTextField.center.y + 50 , 50, 28)];
        [self.goButton setTitle:@"Go" forState:UIControlStateNormal];
        [self.goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.goButton setBackgroundColor:lightBlueColor];
        [self.goButton setBounds:CGRectMake(self.passWordTextField.center.x - 20 , self.passWordTextField.center.y + 50 , 50, 28)];
        [self.goButton addTarget:self action:@selector(goButtonAction) forControlEvents:UIControlEventTouchUpInside];

      
    [mainView addSubview:self.passWordTextField];
    [mainView addSubview:self.goButton];
    }
    
}

- (void) goButtonAction {
    
    NSLog(@"GO Clicked");
    [self.passWordTextField setBackgroundColor:[UIColor colorWithRed: 99.0/255.0 green: 184.0/255.0 blue:255.0/255.0 alpha: 1.0]];
    [self.passWordTextField setSecureTextEntry:NO];
    [self.passWordTextField setText:@"Decrypting..."];
    [self.passWordTextField setTextAlignment:NSTextAlignmentCenter];
    [self.passWordTextField setTextColor:[UIColor whiteColor]];
}

- (void) configureSettingView :(UIView*) settingView {
    
    //TODO: Build Settings Controller
    //TODO: Add UIPAGE and TextFields in the PAGE
    
}

@end

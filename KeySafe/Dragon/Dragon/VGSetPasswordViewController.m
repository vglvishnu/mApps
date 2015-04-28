//
//  VGSetPasswordViewController.m
//  Dragon
//
//  Created by Vishnu on 4/26/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGSetPasswordViewController.h"

@interface VGSetPasswordViewController ()

@property (nonatomic) UIView *parentView;

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
    [parentView setBackgroundColor:[UIColor blackColor]];
    self.setPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                           ((parentViewSize.height)/7.5 - 28), parentViewSize.width -70, 28)];
    [self.setPasswordTextField setPlaceholder:@"password"];
    [self.setPasswordTextField setSecureTextEntry:YES];
    [self.setPasswordTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
    [self.setPasswordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.setPasswordTextField setBackgroundColor:[UIColor whiteColor]];
   
    
    
    // confirm password text field
    self.setPasswordConfirmTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                              ((parentViewSize.height)/5 - 28), parentViewSize.width -70, 28)];
    [self.setPasswordConfirmTextField setPlaceholder:@"confirm password"];
    [self.setPasswordConfirmTextField setSecureTextEntry:YES];
    [self.setPasswordConfirmTextField setBackgroundColor:[UIColor colorWithRed:245 green:253 blue:218 alpha:0]];
    [self.setPasswordConfirmTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.setPasswordConfirmTextField setDelegate:self];
    [self.setPasswordConfirmTextField setBackgroundColor:[UIColor whiteColor]];
   
    
    
    //Next button
    
    self.setPasswordNextButton =  [UIButton  buttonWithType:UIButtonTypeRoundedRect];
    self.setPasswordNextButton.layer.cornerRadius = 5;
    [self.setPasswordNextButton setFrame:CGRectMake(self.setPasswordConfirmTextField.center.x - 30 , self.setPasswordConfirmTextField.center.y + 50 , 50, 28)];
    [self.setPasswordNextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self.setPasswordNextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.setPasswordNextButton setBackgroundColor:[UIColor colorWithRed: 99.0/255.0 green: 184.0/255.0 blue:255.0/255.0 alpha: 1.0]];
    [self.setPasswordNextButton setBounds:CGRectMake(self.setPasswordConfirmTextField.center.x - 20 , self.setPasswordConfirmTextField.center.y + 50 , 50, 28)];
    [self.setPasswordNextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.setPasswordNextButton setEnabled:NO];
    
    
    [parentView addSubview:self.setPasswordTextField];
    [parentView addSubview:self.setPasswordConfirmTextField];
    [parentView addSubview:self.setPasswordNextButton];
    
    
}

- (void) nextButtonAction {
    
    if (self.setPasswordTextField.text.length > 0 && self.setPasswordConfirmTextField.text.length > 0)
    {
        if ([self.setPasswordTextField.text isEqualToString:self.setPasswordConfirmTextField.text]){
            //TODO: set pass word confirmed and do the configurations
        }
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    // Enable/disable the button depending on the length of the text
    if (newLength > 0 && self.setPasswordTextField.text.length > 0)
         self.setPasswordNextButton.enabled = YES;
    else
         self.setPasswordNextButton.enabled = NO;
    
    return (newLength > 0)? YES:NO;
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

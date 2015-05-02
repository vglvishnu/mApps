//
//  VGSetPrefViewController.m
//  Dragon
//
//  Created by Vishnu on 4/29/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGSetPrefViewController.h"
#import "VGLockTimePickViewDelegate.h"
#import "VGTolarableRetryPickViewDelegate.h"

@interface VGSetPrefViewController ()


@property UIFont  *labelFont;


@end

@implementation VGSetPrefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self configSetPassWordView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) configSetPassWordView:(UIView *) parentView {
    
    
    self.labelFont = [UIFont fontWithName:@"Helvetica Neue" size:14];
    
    CGSize parentViewSize = parentView.frame.size;
    
    [parentView setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
    
    UILabel *securityLabel = [[UILabel alloc] init];
    securityLabel.text     = @"Security";
    //[securityLabel setFrame:CGRectMake(65,10,150,28)];
    [securityLabel setFrame:CGRectMake(parentView.frame.origin.x + 100,
                                     ((parentViewSize.height)/15 - 28), parentViewSize.width -70, 28)];
    [securityLabel setTextColor:[UIColor blackColor]];
    
    
    self.enableTouchLogin = [[UISwitch alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 225,
                                                                        ((parentViewSize.height)/6 - 28), parentViewSize.width -70, 28)];
    
    [self.enableTouchLogin setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.enableTouchLogin setUserInteractionEnabled:YES];
    [self.enableTouchLogin setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.enableTouchLogin setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
    [self.enableTouchLogin setOn:YES animated:YES];

   
    UILabel *touchLabel = [[UILabel alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 20,
                                                                    ((parentViewSize.height)/6 - 28), parentViewSize.width -70, 28)];
    
    [touchLabel setText:@"Enable Touch"];
    [touchLabel setFont:self.labelFont];
    
    
    
    self.pickLockTime = [[UIPickerView alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 200,
                                                                       ((parentViewSize.height)/5 - 28), parentViewSize.width -250, 30)];
    
    VGLockTimePickViewDelegate *lockTimeDelegate = [[VGLockTimePickViewDelegate alloc] initWithDataSource];
    
    [self.pickLockTime setDataSource:lockTimeDelegate];
    [self.pickLockTime setDelegate:lockTimeDelegate];
     self.pickLockTime.showsSelectionIndicator = YES;

    
    [self addChildViewController:lockTimeDelegate];
    
    
    
    
    self.lockOnExit = [[UISwitch alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 225,
                                                                       ((parentViewSize.height)/2 - 20), parentViewSize.width -70, 28)];
    
    [self.lockOnExit setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.lockOnExit setUserInteractionEnabled:YES];
    [self.lockOnExit setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.lockOnExit setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
    [self.lockOnExit setOn:YES animated:YES];
    
    
    UILabel *lockOnExitLabel = [[UILabel alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 20,
                                                                    ((parentViewSize.height)/2 - 20), parentViewSize.width -70, 28)];
    
    [lockOnExitLabel setText:@"Lock on exit"];
    [lockOnExitLabel setFont:self.labelFont];
    
    
    
    self.pickTolarableRetry = [[UIPickerView alloc] initWithFrame:CGRectMake(parentView.frame.origin.x + 50,
                                                                       ((parentViewSize.height)/5 - 28), parentViewSize.width -250, 30)];
    
    VGTolarableRetryPickViewDelegate *tolorableRetryDelegate = [[VGTolarableRetryPickViewDelegate alloc] initWithDataSource];
    
    [self.pickTolarableRetry setDataSource:tolorableRetryDelegate];
    [self.pickTolarableRetry setDelegate:tolorableRetryDelegate];
    self.pickTolarableRetry.showsSelectionIndicator = YES;
    
    
    [self addChildViewController:tolorableRetryDelegate];
    
    
    
    
    [parentView addSubview:securityLabel];
    [parentView addSubview:touchLabel];
    [parentView addSubview:self.enableTouchLogin];
    
    [parentView addSubview:self.pickLockTime];
    [parentView addSubview:lockOnExitLabel];
    [parentView addSubview:self.lockOnExit];
    [parentView addSubview:self.pickTolarableRetry];
    
   

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

//
//  VGSetPrefViewController.m
//  Dragon
//
//  Created by Vishnu on 4/29/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGSetPrefViewController.h"

@interface VGSetPrefViewController ()

@property (nonatomic) UISwitch *enableTouchLogin;
@property (nonatomic) UIPickerView *pickLockTime;
@property (nonatomic) UISwitch *lockOnExit;
@property (nonatomic) UIPickerView *pickTolarableRetry;



@end

@implementation VGSetPrefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureSetPassWordView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) configureSetPassWordView:(UIView *) parentView {
    
    CGSize parentViewSize = parentView.frame.size;
    
    [parentView setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
    
    UILabel *securityLabel = [[UILabel alloc] init];
    securityLabel.text     = @"Security";
    //[securityLabel setFrame:CGRectMake(65,10,150,28)];
    [securityLabel setFrame:CGRectMake(parentView.frame.origin.x + 100,
                                     ((parentViewSize.height)/15 - 28), parentViewSize.width -70, 28)];
    [securityLabel setTextColor:[UIColor blackColor]];
    [parentView addSubview:securityLabel];
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

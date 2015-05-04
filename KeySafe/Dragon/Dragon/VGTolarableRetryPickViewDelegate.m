//
//  VGTolarableRetryPickViewDelegateViewController.m
//  Dragon
//
//  Created by Vishnu on 5/1/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGTolarableRetryPickViewDelegate.h"


@interface VGTolarableRetryPickViewDelegate ()

@property (nonatomic) NSMutableArray *tolarableRetryArray;

@end

@implementation VGTolarableRetryPickViewDelegate

- (id) initWithDataSource {
    
    self = [super init];
    
    if(self) {
        
        self.tolarableRetryArray = [[NSMutableArray alloc] init];
        [self.tolarableRetryArray addObject:@"3"];
        [self.tolarableRetryArray addObject:@"5"];
        [self.tolarableRetryArray addObject:@"10"];
        [self.tolarableRetryArray addObject:@"none"];
        //[self.tolarableRetryArray addObject:@"none"];
    }
    
    self.selectedCategory = [NSString stringWithFormat:@"%@",[self.tolarableRetryArray objectAtIndex:0]];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    
    NSLog(@"%@",[self.tolarableRetryArray objectAtIndex:row]);
    self.selectedCategory = [NSString stringWithFormat:@"%@",[self.tolarableRetryArray objectAtIndex:row]];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.tolarableRetryArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //NSString *title;
    
    return [self.tolarableRetryArray objectAtIndex:row];
    //return @"Hi";
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 100;
    
    return sectionWidth;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
    label.backgroundColor = [UIColor colorWithRed:153.0/255.0 green:204.0/255.0 blue:255.0/255.0 alpha:1.0];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10];
    label.text = [NSString stringWithFormat:@"%@",[self.tolarableRetryArray objectAtIndex:row]];
    return label;
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

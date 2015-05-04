//
//  VGLockTimePickViewDelegate.m
//  Dragon
//
//  Created by Vishnu on 4/30/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGLockTimePickViewDelegate.h"

@interface VGLockTimePickViewDelegate()

@property (nonatomic) NSMutableArray *lockTimeArray;

@end

@implementation VGLockTimePickViewDelegate

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id) initWithDataSource {
    
    self = [super init];
    
    if(self) {
        
        self.lockTimeArray = [[NSMutableArray alloc] init];
        [self.lockTimeArray addObject:@"3 min"];
        [self.lockTimeArray addObject:@"5 mins"];
        [self.lockTimeArray addObject:@"10 mins"];
        [self.lockTimeArray addObject:@"none"];
    }
    
    self.selectedCategory = [NSString stringWithFormat:@"%@",[self.lockTimeArray objectAtIndex:0]];
    return self;
}

-(void) viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    
    NSLog(@"%@",[self.lockTimeArray objectAtIndex:row]);
    self.selectedCategory = [NSString stringWithFormat:@"%@",[self.lockTimeArray objectAtIndex:row]];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.lockTimeArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //NSString *title;
   
    return [self.lockTimeArray objectAtIndex:row];
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
    label.text = [NSString stringWithFormat:@"%@",[self.lockTimeArray objectAtIndex:row]];
    return label;
}


@end

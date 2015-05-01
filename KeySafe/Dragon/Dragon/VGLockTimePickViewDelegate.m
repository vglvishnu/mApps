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
        [self.lockTimeArray addObject:@"1 min"];
        [self.lockTimeArray addObject:@"2 mins"];
        [self.lockTimeArray addObject:@"5 mins"];
        [self.lockTimeArray addObject:@"10 mins"];
        [self.lockTimeArray addObject:@"15 mins"];
        [self.lockTimeArray addObject:@"20 mins"];
        [self.lockTimeArray addObject:@"25 mins"];
        [self.lockTimeArray addObject:@"30 mins"];
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


@end

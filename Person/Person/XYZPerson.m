//
//  XYZPerson.m
//  Person
//
//  Created by Vishnu on 1/8/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"

@interface XYZPerson()
    
    @property NSDate *lastUpdateDateTime;

@end

@implementation XYZPerson {
    
    NSDate *_lastModifiedDate ;
}

-(NSMutableString *) sayGoodBye:(NSMutableString *)greetings {
    
    
    [greetings stringByAppendingString:[self firstName]];
    [greetings appendString:@"----SFO"];
    
    return greetings;
}

-(void) sayHowdy:(NSString *)greetings {
    
    [self saySomething:(greetings)];
}

-(void) sayHello:(NSString *) greetings {

    
    [self saySomething:(greetings)];
    
}

-(void) saySomething:(NSString *)someGreetings {
    
    
    NSLog(@"%@  %@  %@", someGreetings, _firstName, [self lastName]);
    
    NSDate *originalDate = [NSDate date];
    
    [self setLastUpdateDateTime:[NSDate date]];
    
    NSLog(@"Extended Property lastUpdateDateTime  %@=" ,  [self lastUpdateDateTime]);
    
    _lastModifiedDate = originalDate;
    
    NSLog(@"Current date %@", _lastModifiedDate);
}

-(id) initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {
    
    self = [super init];
    
    if(self){
        
        _firstName = aFirstName;
        _lastName  = aLastName;
    }
    
    return self;
}

- (id)init {
    return [self initWithFirstName:@"Sri Dathri Default" lastName:@"Default"];
}

+(instancetype) personWithFirstAndLastName:(NSString *) afirstName lastName:(NSString *) aLastName {
    
    return [[XYZPerson alloc] initWithFirstName:afirstName lastName:aLastName ];
}

@end

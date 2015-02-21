//
//  main.m
//  Person
//
//  Created by Vishnu on 1/8/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "GunaLikePerson.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        XYZPerson  *somePerson = [XYZPerson new];
        [somePerson sayHello:@"Hi Good Morning"];
       
        
        //somePerson.firstName = @"Vishnu";
        [somePerson setFirstName:@"Vishnu"];
        
    
        GunaLikePerson   *guna = [[GunaLikePerson alloc] initWithFirstName:@"Guna" lastName:@"Manikka"];
        [somePerson sayHello:([guna shouteIt:(@"Rai PeeSee")])];
       
        
        XYZPerson *sriPerson = [XYZPerson personWithFirstAndLastName:@"Sri " lastName:@"Mai"];
        [sriPerson sayHello:@"My dear baby"];
        [sriPerson sayHowdy:@"Howdy"];
        
        XYZPerson __weak *weakperson = [XYZPerson new];
        
        [weakperson saySomething:@"Howdy"];
        
        if(weakperson){
            NSLog(@"I am after weak");
        } else {
            NSLog(@"We lost Weak person");
        }
        
        
       
        NSString *getGreetings;
        
        if([sriPerson respondsToSelector:@selector(sayGoodBye:)]){
            
            NSMutableString *greet = [NSMutableString stringWithString:@"Sweet Dream"];
            
            getGreetings = [sriPerson sayGoodBye:greet];
        }
        
        NSLog(@" Here is the Good bye greetings %@",getGreetings);

    }
    
    
    NSInteger anInteger = 64;
    NSUInteger anUnsignedInteger = 100;
    
    NSNumber *firstInteger = [[NSNumber alloc] initWithInteger:anInteger];
    NSNumber *secondInteger = [NSNumber numberWithUnsignedInteger:anUnsignedInteger];
                             
    typedef struct {int aI;float aF;} MyIntFloatStruct;
    
     MyIntFloatStruct as;
    as.aI = 10;
    as.aF = 11.00;
   
    
    
    NSValue  *structValue = [NSValue value:&as withObjCType:@encode(MyIntFloatStruct)];
    
    id thridObject = nil;
    
    NSArray *someArray = [NSArray arrayWithObjects: firstInteger, secondInteger, thridObject];
    
    NSLog(@" This Array contain %lu", [someArray count]+ 1);
    
    NSMutableArray *someMutableArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    
    double (^multiplyTwoValues)(double,double) = ^ (double firstValue, double secondValue){
        
        return firstValue * secondValue;
    };
    
    double result = multiplyTwoValues (5,20);
    NSLog(@"Result = %f", result);
  
    
    void (^(^complexBlock)(void (^)(void)))(void) = ^ (void (^aBlock)(void)) {
        NSLog(@"Result = %f", result);
        return ^{
            NSLog(@"complexBlock = %f", result);
        };
    };
    return 0;
    
    
}

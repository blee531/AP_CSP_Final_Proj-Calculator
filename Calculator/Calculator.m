//
//  Calculator.m
//  Calculator
//
//  Created by Ushio Cheng on 2018/5/15.
//  Copyright © 2018年 Ushio Cheng. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator



-(double)evaluateExpression:(NSString *) expression{
    NSMutableArray * charList = [[NSMutableArray alloc] initWithCapacity:@%d, (expression.length)];
    NSMutableArray * operatorPosition = [[NSMutableArray alloc] initWithCapacity:@1];
    for(NSUInteger pointer = 0;pointer<expression.length;pointer++){
        char charAtPointer = [expression characterAtIndex:i]
        [charList replaceObjectAtIndex:pointer withObject:charAtPointer];
        if(charAtPointer=='+'||charAtPointer=='-'||charAtPointer=='*'||charAtPointer=='/'){
            [operatorPosition addObject:pointer];
        }
    }
    NSMutableDictionary * operationList = [[NSMutableDictionary alloc] initWithCapacity:@1];
    [operationList setObject:(ObjectType)anObject forKey:operatorPosition[pointer]];
}

@end

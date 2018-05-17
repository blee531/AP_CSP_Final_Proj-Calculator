//
//  Calculator.h
//  Calculator
//
//  Created by Ushio Cheng on 2018/5/15.
//  Copyright © 2018年 Ushio Cheng. All rights reserved.
//
/*!
 @header Calculator.h
 @brief a class use to convert string to expression
 @author Ushio Cheng
 @version 0.0.1
 @remark N/A
 */
#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(double)evaluateExpression:(NSString *) expression;



@end

//
//  Calculator.m
//  Calculator
//
//  Created by Ushio Cheng on 2018/5/15.
//  Copyright © 2018年 Ushio Cheng. All rights reserved.
//

//Continue @ Line 72-85

#import "Calculator.h"

@implementation Calculator



-(double)evaluateExpression:(NSString *) expression{
    //variable declearation
    NSUInteger inputLength = expression.length;
    NSMutableArray * charList = [[NSMutableArray alloc] initWithCapacity:inputLength];//NSS array of char of string input
    NSMutableArray * operatorPosition = [[NSMutableArray alloc] initWithCapacity:1];//NSN array of operartor position
    NSMutableArray * operationList = [[NSMutableArray alloc] initWithCapacity:1];//NSS array of operator at position
    NSMutableArray * operationHierarchy = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableArray * partitionedNumberInStringList = [[NSMutableArray alloc] initWithCapacity:1];
    NSMutableArray * partitionedNumberInDoubleList = [[NSMutableArray alloc] initWithCapacity:1];
    NSUInteger * partitionPointer = 0;
    NSMutableString * stringBuffer = [[NSMutableString alloc] initWithCapacity:1];
    int operationCount = 0;
    double result=0;//if return 0, result may failed to be operated
    
    
    
    //main
    //find position of operartor/partition number
    [stringBuffer setString:@""];
    [partitionedNumberInStringList replaceObjectAtIndex:0 withObject:stringbuffer];
    for(NSUInteger pointer = 0;pointer<expression.length;pointer++){
        char charAtPointer = [expression characterAtIndex:pointer];
        NSString * stringFormOfCharAtPointer = [[NSString alloc] initWithFormat:@"%c", charAtPointer];
        [charList replaceObjectAtIndex:pointer withObject:stringFormOfCharAtPointer];
        if(charAtPointer=='+'||charAtPointer=='-'||charAtPointer=='*'||charAtPointer=='/'){
            [operatorPosition addObject:[[NSNumber alloc] initWithUnsignedLong:pointer]];
            operationCount++;
            [partitionedNumberInStringList insertObject:stringBuffer atIndex:partitionPointer];
            [stringBuffer setString:@""];
            partitionPointer++;
        } else {
            [stringBuffer appendString:stringFormOfCharAtPointer];
        }
    }
    
    
    if (operationCount==0) {
        goto noOperation;
    }//if no operation jump and log error
    
    
    [partitionedNumberInDoubleList removeAllObjects];
    for(NSString * item in partitionedNumberInStringList){
        [partitionedNumberInDoubleList addObject:[[NSNumber alloc] initWithDouble:[Calculator constructNumberFromString:item]];
    }
    
    
    [operatorPosition removeObjectAtIndex:0];
    [charList removeObjectAtIndex:0];
    
    
    for(NSUInteger pointer = 0;pointer<operationCount;pointer++){
        char charAtListAccordingToPointer = [expression characterAtIndex:(unsigned long int)operatorPosition[pointer]];
        NSString * stringFormOfCharAtPointer = [[NSString alloc] initWithFormat:@"%c", charAtListAccordingToPointer];
        [operationList addObject:stringFormOfCharAtPointer];
        [operationHierarchy addObject:@0];
    }//Create operation List
    
    
    [operationList removeObjectAtIndex:0];
    [operationHierarchy removeObjectAtIndex:0];
    
    
    for(NSUInteger pointer = 0;pointer<operationCount;pointer++){
        if ([operationList[pointer] isEqual:"*"]||[operationList[pointer] isEqual:"/"]) {
            [operationHierarchy replaceObjectAtIndex: withObject:[[NSNumber alloc] numberWithInt: (operationCount-(int)pointer+1)]];
        }//calc. operation hierarchy
    }
    
    noOperation : {//label, jump when no operation sign found
        //return section
        if (operationCount==0) {
            //!!!: NO operation Error
            NSLog(@"Error! error from calculator.eval there is no operator!");
            return result;//change to output orig number
        } else {
            return result;
        }
    }
}

/**
 * @brief Construct a double base on a string form number
 * @param stringFormNumber the string form of the number. as NSMutableString
 * @return the number created based on the string or 0 if error occur. as double
 * @remark if error, it would throw 0 as output and make NSLog.
 * @code
 *      if (percisionLevel==-1) {
 *          result = [Calculator appendInteger:(int)chatAtPointer toNumber:result withPercision:-1];
 *      } else {
 *          result = [Calculator appendInteger:(int)chatAtPointer toNumber:result withPercision:percisionLevel];
 *          percisionLevel++;
 *      }
 * @endcode
 */
+(double)constructNumberFromString:(NSString *) stringFormNumber{
    int percisionLevel = -1;
    Boolean errorQ = false;
    double result=0;
    for (int pointer=0; pointer < stringFormNumber.length; pointer++) {
        char chatAtPointer = [stringFormNumber characterAtIndex:pointer];
        if (chatAtPointer=='.'&&percisionLevel!=-1) {
            errorQ = true;
            NSLog(@"Error! error from calculate.constructNumber: two dot appear in one number!");
            goto errorJumpLabel;
        }
        if (chatAtPointer=='.') {
            percisionLevel = 0;
        }else{
            if (percisionLevel==-1) {
                result = [Calculator appendInteger:(int)chatAtPointer toNumber:result withPercision:-1];
            } else {
                result = [Calculator appendInteger:(int)chatAtPointer toNumber:result withPercision:percisionLevel];
                percisionLevel++;
            }
        }
    }
errorJumpLabel:{
    if (errorQ) {
        return 0;//error return
    }else{
        return result;
    }
}
}


/**
 * @brief Add a digit to an existing number.
 * @param integer The digit is going to be add to the number. as int
 * @param originalNumber The original number. as double
 * @param percision The percision param is number of digits from dot, ex.1.->0,0.1->1,0.01->2, etc as int
 * @return the new number. as double
 * @remark if percision is -1, the number is int and would treat as append int
 * @code
 *      if(percision==0){
 *          return orignum*10+integer;
 *      }else{
 *          return orignum+integer/10^(perciesion+1)    //ex.{2,10.1,1}->10.12
 * @endcode
 */
+(double)appendInteger:(int)integer toNumber:(double)originalNumber withPercision:(int) percision{
    if (percision==0) {
        return (originalNumber*10+integer);
    } else {
        return (originalNumber+((double)integer)/[Calculator powerOfNumber:10 toExponent:(percision+1)]);
    }
}


+(double)powerOfNumber:(double)base toExponent:(int)exponent{
    double result=1;
    if (exponent==0) {
        return result;
    } else {
        if (exponent>0) {
            for (int repeatTimes=0; repeatTimes<exponent; repeatTimes++) {
                result*=base;
            }
            return result;
        } else {
            for (int repeatTimes=0; repeatTimes<exponent; repeatTimes++) {
                result/=base;
            }
            return result;
        }
    }
}


@end

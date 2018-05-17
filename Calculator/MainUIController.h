//
//  MainUIController.h
//  Calculator
//
//  Created by Ushio Cheng on 2018/5/15.
//  Copyright © 2018年 Ushio Cheng. All rights reserved.
//
/*!
 @header MainUIController.h
 @brief <>
 @author Ushio Cheng
 @version 0.0.1
 @remark <>
 */
#import <Foundation/Foundation.h>

@interface MainUIController : NSObject{
    IBOutlet id experssionDisp;
    IBOutlet id resultDisp;
    double numberBeingCalculatedBuffer;
    double numberCalculateBuffer;
    double claculationResultBuffer;
}

+(IBAction)Number1Pressed:(id)sender;
+(IBAction)Number2Pressed:(id)sender;
+(IBAction)Number3Pressed:(id)sender;
+(IBAction)Number4Pressed:(id)sender;
+(IBAction)Number5Pressed:(id)sender;
+(IBAction)Number6Pressed:(id)sender;
+(IBAction)Number7Pressed:(id)sender;
+(IBAction)Number8Pressed:(id)sender;
+(IBAction)Number9Pressed:(id)sender;
+(IBAction)Number0Pressed:(id)sender;
+(IBAction)NumberdotPressed:(id)sender;

+(IBAction)addKeyPressed:(id)sender;
+(IBAction)minusKeyPressed:(id)sender;
+(IBAction)multiplyKeyPressed:(id)sender;
+(IBAction)divideKeyPressed:(id)sender;


+(IBAction)evaluateAndDispResult:(id)sender;





@end

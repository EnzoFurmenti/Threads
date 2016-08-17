//
//  Student.h
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class Student;
typedef void(^TotalBlock)(NSString*name,CGFloat timeInterval);

@interface Student : NSObject
@property (nonatomic,strong) NSString *firstName;

- (void)rightNumber:(NSInteger)guessNumber
         rangeStart:(NSInteger)rangeStart
        rangeFinish:(NSInteger)rangeFinish
         totalBlock:(TotalBlock) totalBlock;

- (id)initWithFirstName:(NSString*)firstName
           guessNumber:(NSInteger)guessNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock)totalBlock;

+ (dispatch_queue_t)getQueue;

@end

//
//  Student.h
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
typedef void(^TotalBlock)(void);

@interface Student : NSObject
@property (nonatomic,strong) NSString *firstName;

- (void)isRightResponse:(NSInteger)randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock) totalBlock;

- (id)initWithFirstName:(NSString*)firstName
           randomNumber:(NSInteger)randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock)totalBlock;

+ (dispatch_queue_t)getQueue;

@end

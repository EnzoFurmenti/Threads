//
//  Student.m
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Student.h"
#import <CoreGraphics/CGBase.h>


typedef void(^TotalBlock)(void);


@implementation Student

- (id)initWithFirstName:(NSString*)firstName
           randomNumber:(NSInteger)randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock)totalBlock{
    self = [super init];
    if(self)
    {
        self.firstName = firstName;
        dispatch_queue_t queue = [Student getQueue];
        dispatch_async(queue, ^{
            [self isRightResponse:randomNumber rangeStart:rangeStart rangeFinish:rangeFinish totalBlock:totalBlock];
        });
    }
    return self;
}

#pragma mark - Metods-
- (void)isRightResponse:(NSInteger)randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock) totalBlock{
    
    @autoreleasepool{
        
        double startTime = CFAbsoluteTimeGetCurrent();
         totalBlock = ^{
            NSLog(@"%@ - student %@ - thread finished %f",self.firstName,[[NSThread currentThread] name], CFAbsoluteTimeGetCurrent() - startTime);
        };
        
        NSLog(@"%@ - student %@ - thread started",self.firstName,[[NSThread currentThread] name]);
        NSInteger currentNumberByStudent = 0;
        while (randomNumber != currentNumberByStudent)
        {
           currentNumberByStudent = rangeStart + arc4random() % rangeFinish;
        }
        dispatch_async(dispatch_get_main_queue(),totalBlock);
    }
}

+ (dispatch_queue_t)getQueue{
    static dispatch_queue_t queueStatic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queueStatic = dispatch_queue_create("com.EFCompany.LessonThreadsStat", DISPATCH_QUEUE_CONCURRENT);
    });
    return queueStatic;
}


@end

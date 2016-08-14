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
           randomNumber:(NSInteger) randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish totalBlock:(TotalBlock)totalBlock{
    self = [super init];
    if(self)
    {
        self.firstName = firstName;

        dispatch_queue_t queue = dispatch_queue_create("com.EFCompany.LessonThreads", DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
            [self isRightResponse:randomNumber rangeStart:rangeStart rangeFinish:rangeFinish];
        });

        dispatch_async(dispatch_get_main_queue(),totalBlock);
    }
    return self;
}


- (void)isRightResponse:(NSInteger) randomNumber
                  rangeStart:(NSInteger)rangeStart
                 rangeFinish:(NSInteger)rangeFinish{
    
    @autoreleasepool{
        
        double startTime = CFAbsoluteTimeGetCurrent();
        TotalBlock totalBlock = ^{
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

@end

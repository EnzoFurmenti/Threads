//
//  Student.m
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Student.h"

@interface Student ()

@property (nonatomic, copy) TotalBlock totalBlock;

@end

@implementation Student

- (id)initWithFirstName:(NSString*)firstName
           guessNumber:(NSInteger)guessNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
            totalBlock:(TotalBlock)totalBlock{
    self = [super init];
    if(self)
    {
        self.firstName = firstName;
        dispatch_queue_t queue = [Student getQueue];
        dispatch_async(queue, ^{
            [self rightNumber:guessNumber rangeStart:rangeStart rangeFinish:rangeFinish totalBlock:totalBlock];
        });
    }
    return self;
}

#pragma mark - Metods -
- (void)rightNumber:(NSInteger)guessNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock) totalBlock{
    
        double startTime = CFAbsoluteTimeGetCurrent();
        NSLog(@"%@ - student %@ - thread started",self.firstName,[[NSThread currentThread] name]);
        NSInteger currentNumberByStudent = 0;
        while (guessNumber != currentNumberByStudent)
        {
           currentNumberByStudent = rangeStart + arc4random() % rangeFinish;
        }
        self.totalBlock = totalBlock;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.totalBlock(self.firstName, CFAbsoluteTimeGetCurrent() - startTime);
        });
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

//
//  StudentOtherApproach.m
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "StudentOtherApproach.h"
#import "StudentOAOp.h"

//static NSOperationQueue * queueStatic;

@implementation StudentOtherApproach


- (id)initWithFirstName:(NSString*)firstName
           guessNumber:(NSInteger)guessNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock)totalBlock{
    self = [super init];
    if(self)
    {
        self.firstName = firstName;
        NSOperationQueue *opQueue = [StudentOtherApproach getQueue];
        NSOperation *op = [[StudentOAOp alloc] initWithStudent:self totalBlock:totalBlock];
        [opQueue addOperation:op];
    }
    return self;
}

//#pragma mark - Metods-
//- (void)rightResponse:(NSInteger)randomNumber
//             rangeStart:(NSInteger)rangeStart
//            rangeFinish:(NSInteger)rangeFinish
//             totalBlock:(TotalBlock) totalBlock{
//        
//        double startTime = CFAbsoluteTimeGetCurrent();
//        totalBlock = ^{
//            NSLog(@"%@ - student %@ - NSOperation finished %f",self.firstName,[[NSThread currentThread] name], CFAbsoluteTimeGetCurrent() - startTime);
//        };
//        
//        NSLog(@"%@ - student %@ - NSOperation started",self.firstName,[[NSThread currentThread] name]);
//        NSInteger currentNumberByStudent = 0;
//        while (randomNumber != currentNumberByStudent)
//        {
//            currentNumberByStudent = rangeStart + arc4random() % rangeFinish;
//        }
//        
//        NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:totalBlock];
//        NSOperationQueue *opMainQueue = [NSOperationQueue mainQueue];
//        [opMainQueue addOperation:blockOp];
//}
//
//- (NSInvocation*)createInvocationRightResponse:(NSInteger)randomNumber
//                              rangeStart:(NSInteger)rangeStart
//                             rangeFinish:(NSInteger)rangeFinish
//                              totalBlock:(TotalBlock) totalBlock{
//
//
//    SEL selector = @selector(rightResponse:rangeStart:rangeFinish:totalBlock:);
//    
//    NSMethodSignature *signature = [StudentOtherApproach instanceMethodSignatureForSelector:selector];
//    
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:self];
//    [invocation setSelector:selector];
//    NSInteger invRandomNumber = randomNumber;
//    NSInteger invRangeStart = rangeStart;
//    NSInteger invRangeFinish = rangeFinish;
//    totalBlock = [totalBlock copy];
//    [invocation setArgument:&invRandomNumber atIndex:2];
//    [invocation setArgument:&invRangeStart atIndex:3];
//    [invocation setArgument:&invRangeFinish atIndex:4];
//    [invocation setArgument:&totalBlock atIndex:5];
//    
//    return invocation;
//}



+ (NSOperationQueue*)getQueue{
    static NSOperationQueue *queueStatic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queueStatic = [[NSOperationQueue alloc] init];
    });
    return queueStatic;
}


@end


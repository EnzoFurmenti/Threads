//
//  StudentOp.m
//  Threads
//
//  Created by EnzoF on 16.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "StudentOAOp.h"


@interface StudentOAOp ()
@property (nonatomic,strong) StudentOtherApproach *studentOA;
@property (nonatomic, copy) TotalBlock totalBlock;

@end

@implementation StudentOAOp

- (instancetype)initWithStudent:(StudentOtherApproach*)studentOA
                     totalBlock:(TotalBlock)totalBlock{
    self = [super init];
    if(self)
    {
        self.studentOA = studentOA;
        self.totalBlock = totalBlock;
    }
    return self;
}

- (void)main{
    
    double startTime = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"%@ - student %@ - NSOperation started",self.studentOA.firstName,[[NSThread currentThread] name]);
    NSInteger currentNumberByStudent = 0;
    while (self.studentOA.guessNumber != currentNumberByStudent)
    {
        currentNumberByStudent = self.studentOA.rangeStart + arc4random() % self.studentOA.rangeFinish;
    }
    self.totalBlock(self.studentOA.firstName,CFAbsoluteTimeGetCurrent() - startTime);
//        NSLog(@"%@ - student %@ - NSOperation finished %f",self.firstName,[[NSThread currentThread] name], CFAbsoluteTimeGetCurrent() - startTime);
}






@end

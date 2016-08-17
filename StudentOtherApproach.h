//
//  StudentOtherApproach.h
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class StudentOtherApproach;
typedef void(^TotalBlock)(NSString*name,CGFloat timeInterval);

@interface StudentOtherApproach : NSObject

@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,assign) NSInteger guessNumber;
@property (nonatomic,assign) NSInteger rangeStart;
@property (nonatomic,assign) NSInteger rangeFinish;

- (id)initWithFirstName:(NSString*)firstName
            guessNumber:(NSInteger)guessNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish
             totalBlock:(TotalBlock)totalBlock;

+ (NSOperationQueue*)getQueue;

@end

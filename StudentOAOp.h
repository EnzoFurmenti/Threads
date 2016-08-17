//
//  StudentOp.h
//  Threads
//
//  Created by EnzoF on 16.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "StudentOtherApproach.h"
@class StudentOAOp;
typedef void(^TotalBlock)(NSString*name,CGFloat timeInterval);@interface StudentOAOp : NSOperation

- (instancetype)initWithStudent:(StudentOtherApproach*)studentOA
                     totalBlock:(TotalBlock)totalBlock;


@end
